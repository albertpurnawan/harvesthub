import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/data/repos/farm_fields_repo.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';

class FieldFormScreen extends HookConsumerWidget {
  final int? siteId;
  const FieldFormScreen({super.key, this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final sitesFuture = (db.select(db.farmSites)).get();
    final cropsFuture = (db.select(db.crops)).get();
    final nameController = useTextEditingController();
    final codeController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final rowWidthController = useTextEditingController();
    final hexController = useTextEditingController(text: '00FF00');
    final rowDirection = useState<String?>(null);
    final primaryCropId = useState<int?>(null);
    final siteIdState = useState<int?>(siteId);
    final color = useState<Color>(Colors.green);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final repo = ref.watch(farmFieldsRepoProvider);

    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'Field Form'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Form(
                  key: formKey,
                  child: FutureBuilder(
                    future: Future.wait([sitesFuture, cropsFuture]),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                      final sites = snapshot.data![0] as List<FarmSite>;
                      final crops = snapshot.data![1] as List<Crop>;
                      return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.label_outline),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: codeController,
                        decoration: const InputDecoration(
                          labelText: 'Field Code',
                          prefixIcon: Icon(Icons.qr_code_2_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: descriptionController,
                        minLines: 2,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.description_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: rowWidthController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            final text = newValue.text;
                            final isValid = RegExp(r'^\d*\.?\d*$').hasMatch(text);
                            return isValid ? newValue : oldValue;
                          }),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Row width (m)',
                          prefixIcon: Icon(Icons.straighten),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) {
                          final value = (v ?? '').trim();
                          if (value.isEmpty) return 'Row width is required';
                          // Must be a valid number (integer or decimal)
                          final d = double.tryParse(value);
                          if (d == null) return 'Row width must be a number';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: rowDirection.value,
                        items: const [
                          DropdownMenuItem(value: 'North-South', child: Text('North-South')),
                          DropdownMenuItem(value: 'East-West', child: Text('East-West')),
                        ],
                        onChanged: (v) => rowDirection.value = v,
                        decoration: const InputDecoration(
                          labelText: 'Row direction',
                          prefixIcon: Icon(Icons.alt_route),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v == null ? 'Row direction is required' : null,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<int>(
                        value: primaryCropId.value,
                        items: crops
                            .map((c) => DropdownMenuItem(value: c.cropId, child: Text(c.cropCode)))
                            .toList(),
                        onChanged: (v) => primaryCropId.value = v,
                        decoration: const InputDecoration(
                          labelText: 'Primary Crop',
                          prefixIcon: Icon(Icons.eco_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: hexController,
                              decoration: InputDecoration(
                                labelText: 'Field Colour (Hex)',
                                prefixIcon: const Icon(Icons.palette_outlined),
                                border: const OutlineInputBorder(),
                                helperText: '6-digit hex, e.g., 00FF00',
                                suffixIcon: IconButton(
                                  tooltip: 'Pick colour',
                                  padding: EdgeInsets.zero,
                                  icon: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color.value,
                                      border: Border.all(color: Colors.grey.shade400),
                                    ),
                                  ),
                                  onPressed: () async {
                                    Color tempColor = color.value;
                                    final result = await showDialog<bool>(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text('Pick Field Colour'),
                                        content: SingleChildScrollView(
                                          child: SizedBox(
                                            width: 260,
                                            height: 380,
                                            child: ColorPicker(
                                              pickerColor: tempColor,
                                              onColorChanged: (c) {
                                                tempColor = c;
                                              },
                                              enableAlpha: false,
                                              labelTypes: const [],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(ctx, false),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(ctx, true),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                    if (result == true) {
                                      color.value = tempColor;
                                      final rgb = (color.value.value & 0xFFFFFF)
                                          .toRadixString(16)
                                          .padLeft(6, '0')
                                          .toUpperCase();
                                      hexController.text = rgb;
                                    }
                                  },
                                ),
                              ),
                              textCapitalization: TextCapitalization.characters,
                              validator: (v) {
                                final s = (v ?? '').trim();
                                final n = s.startsWith('#') ? s.substring(1) : s;
                                final ok = n.length == 6 && RegExp(r'^[0-9A-Fa-f]{6}$').hasMatch(n);
                                if (!ok) return 'Enter 6-digit hex (0-9,A-F)';
                                return null;
                              },
                            ),
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () async {
                          final valid = formKey.currentState?.validate() ?? false;
                          if (!valid) return;
                          final rowWidth = double.parse(rowWidthController.text);
                          final input = hexController.text.trim();
                          final rgb = (input.startsWith('#') ? input.substring(1) : input)
                              .toUpperCase()
                              .padLeft(6, '0');
                          final userId = ref.read(sessionUserIdProvider);
                          await repo.addField(
                            modifiedUserId: userId!,
                            createdUserId: userId,
                            siteId: siteIdState.value ?? (sites.isNotEmpty ? sites.first.farmSiteId : 1),
                            name: nameController.text.trim(),
                            code: codeController.text.trim().isEmpty ? null : codeController.text.trim(),
                            description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
                            primaryCropId: primaryCropId.value,
                            rowWidth: rowWidth,
                            rowDirection: rowDirection.value!,
                            colorHex: rgb,
                          );
                          if (context.mounted) Navigator.pop(context);
                        },
                        child: const Text('Save Field'),
                      ),
                    ],
                  );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
