
part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isCustomerUserMeta =
      const VerificationMeta('isCustomerUser');
  @override
  late final GeneratedColumn<bool> isCustomerUser = GeneratedColumn<bool>(
      'is_customer_user', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_customer_user" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _userPasswordMeta =
      const VerificationMeta('userPassword');
  @override
  late final GeneratedColumn<String> userPassword = GeneratedColumn<String>(
      'user_password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userGivenNameMeta =
      const VerificationMeta('userGivenName');
  @override
  late final GeneratedColumn<String> userGivenName = GeneratedColumn<String>(
      'user_given_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userEmailAddressMeta =
      const VerificationMeta('userEmailAddress');
  @override
  late final GeneratedColumn<String> userEmailAddress = GeneratedColumn<String>(
      'user_email_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdUserIdMeta =
      const VerificationMeta('createdUserId');
  @override
  late final GeneratedColumn<int> createdUserId = GeneratedColumn<int>(
      'created_user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedUserIdMeta =
      const VerificationMeta('modifiedUserId');
  @override
  late final GeneratedColumn<int> modifiedUserId = GeneratedColumn<int>(
      'modified_user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userStatusMeta =
      const VerificationMeta('userStatus');
  @override
  late final GeneratedColumn<String> userStatus = GeneratedColumn<String>(
      'user_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _farmSiteIdMeta =
      const VerificationMeta('farmSiteId');
  @override
  late final GeneratedColumn<int> farmSiteId = GeneratedColumn<int>(
      'farm_site_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        isCustomerUser,
        username,
        userPassword,
        userGivenName,
        userEmailAddress,
        createdDate,
        createdUserId,
        modifiedDate,
        modifiedUserId,
        userStatus,
        isDeleted,
        farmSiteId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('is_customer_user')) {
      context.handle(
          _isCustomerUserMeta,
          isCustomerUser.isAcceptableOrUnknown(
              data['is_customer_user']!, _isCustomerUserMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('user_password')) {
      context.handle(
          _userPasswordMeta,
          userPassword.isAcceptableOrUnknown(
              data['user_password']!, _userPasswordMeta));
    } else if (isInserting) {
      context.missing(_userPasswordMeta);
    }
    if (data.containsKey('user_given_name')) {
      context.handle(
          _userGivenNameMeta,
          userGivenName.isAcceptableOrUnknown(
              data['user_given_name']!, _userGivenNameMeta));
    }
    if (data.containsKey('user_email_address')) {
      context.handle(
          _userEmailAddressMeta,
          userEmailAddress.isAcceptableOrUnknown(
              data['user_email_address']!, _userEmailAddressMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('created_user_id')) {
      context.handle(
          _createdUserIdMeta,
          createdUserId.isAcceptableOrUnknown(
              data['created_user_id']!, _createdUserIdMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('modified_user_id')) {
      context.handle(
          _modifiedUserIdMeta,
          modifiedUserId.isAcceptableOrUnknown(
              data['modified_user_id']!, _modifiedUserIdMeta));
    }
    if (data.containsKey('user_status')) {
      context.handle(
          _userStatusMeta,
          userStatus.isAcceptableOrUnknown(
              data['user_status']!, _userStatusMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('farm_site_id')) {
      context.handle(
          _farmSiteIdMeta,
          farmSiteId.isAcceptableOrUnknown(
              data['farm_site_id']!, _farmSiteIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      isCustomerUser: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_customer_user'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      userPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_password'])!,
      userGivenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_given_name']),
      userEmailAddress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_email_address']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      createdUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_user_id']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      modifiedUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modified_user_id']),
      userStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_status'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      farmSiteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}farm_site_id']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int userId;
  final bool isCustomerUser;
  final String username;
  final String userPassword;
  final String? userGivenName;
  final String? userEmailAddress;
  final DateTime? createdDate;
  final int? createdUserId;
  final DateTime? modifiedDate;
  final int? modifiedUserId;
  final String userStatus;
  final bool isDeleted;
  final int? farmSiteId;
  const User(
      {required this.userId,
      required this.isCustomerUser,
      required this.username,
      required this.userPassword,
      this.userGivenName,
      this.userEmailAddress,
      this.createdDate,
      this.createdUserId,
      this.modifiedDate,
      this.modifiedUserId,
      required this.userStatus,
      required this.isDeleted,
      this.farmSiteId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['is_customer_user'] = Variable<bool>(isCustomerUser);
    map['username'] = Variable<String>(username);
    map['user_password'] = Variable<String>(userPassword);
    if (!nullToAbsent || userGivenName != null) {
      map['user_given_name'] = Variable<String>(userGivenName);
    }
    if (!nullToAbsent || userEmailAddress != null) {
      map['user_email_address'] = Variable<String>(userEmailAddress);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || createdUserId != null) {
      map['created_user_id'] = Variable<int>(createdUserId);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    if (!nullToAbsent || modifiedUserId != null) {
      map['modified_user_id'] = Variable<int>(modifiedUserId);
    }
    map['user_status'] = Variable<String>(userStatus);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || farmSiteId != null) {
      map['farm_site_id'] = Variable<int>(farmSiteId);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      isCustomerUser: Value(isCustomerUser),
      username: Value(username),
      userPassword: Value(userPassword),
      userGivenName: userGivenName == null && nullToAbsent
          ? const Value.absent()
          : Value(userGivenName),
      userEmailAddress: userEmailAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(userEmailAddress),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdUserId: createdUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdUserId),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      modifiedUserId: modifiedUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedUserId),
      userStatus: Value(userStatus),
      isDeleted: Value(isDeleted),
      farmSiteId: farmSiteId == null && nullToAbsent
          ? const Value.absent()
          : Value(farmSiteId),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['userId']),
      isCustomerUser: serializer.fromJson<bool>(json['isCustomerUser']),
      username: serializer.fromJson<String>(json['username']),
      userPassword: serializer.fromJson<String>(json['userPassword']),
      userGivenName: serializer.fromJson<String?>(json['userGivenName']),
      userEmailAddress: serializer.fromJson<String?>(json['userEmailAddress']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      createdUserId: serializer.fromJson<int?>(json['createdUserId']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      modifiedUserId: serializer.fromJson<int?>(json['modifiedUserId']),
      userStatus: serializer.fromJson<String>(json['userStatus']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      farmSiteId: serializer.fromJson<int?>(json['farmSiteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'isCustomerUser': serializer.toJson<bool>(isCustomerUser),
      'username': serializer.toJson<String>(username),
      'userPassword': serializer.toJson<String>(userPassword),
      'userGivenName': serializer.toJson<String?>(userGivenName),
      'userEmailAddress': serializer.toJson<String?>(userEmailAddress),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'createdUserId': serializer.toJson<int?>(createdUserId),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'modifiedUserId': serializer.toJson<int?>(modifiedUserId),
      'userStatus': serializer.toJson<String>(userStatus),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'farmSiteId': serializer.toJson<int?>(farmSiteId),
    };
  }

  User copyWith(
          {int? userId,
          bool? isCustomerUser,
          String? username,
          String? userPassword,
          Value<String?> userGivenName = const Value.absent(),
          Value<String?> userEmailAddress = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent(),
          Value<int?> createdUserId = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          Value<int?> modifiedUserId = const Value.absent(),
          String? userStatus,
          bool? isDeleted,
          Value<int?> farmSiteId = const Value.absent()}) =>
      User(
        userId: userId ?? this.userId,
        isCustomerUser: isCustomerUser ?? this.isCustomerUser,
        username: username ?? this.username,
        userPassword: userPassword ?? this.userPassword,
        userGivenName:
            userGivenName.present ? userGivenName.value : this.userGivenName,
        userEmailAddress: userEmailAddress.present
            ? userEmailAddress.value
            : this.userEmailAddress,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        createdUserId:
            createdUserId.present ? createdUserId.value : this.createdUserId,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        modifiedUserId:
            modifiedUserId.present ? modifiedUserId.value : this.modifiedUserId,
        userStatus: userStatus ?? this.userStatus,
        isDeleted: isDeleted ?? this.isDeleted,
        farmSiteId: farmSiteId.present ? farmSiteId.value : this.farmSiteId,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      userId: data.userId.present ? data.userId.value : this.userId,
      isCustomerUser: data.isCustomerUser.present
          ? data.isCustomerUser.value
          : this.isCustomerUser,
      username: data.username.present ? data.username.value : this.username,
      userPassword: data.userPassword.present
          ? data.userPassword.value
          : this.userPassword,
      userGivenName: data.userGivenName.present
          ? data.userGivenName.value
          : this.userGivenName,
      userEmailAddress: data.userEmailAddress.present
          ? data.userEmailAddress.value
          : this.userEmailAddress,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      createdUserId: data.createdUserId.present
          ? data.createdUserId.value
          : this.createdUserId,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      modifiedUserId: data.modifiedUserId.present
          ? data.modifiedUserId.value
          : this.modifiedUserId,
      userStatus:
          data.userStatus.present ? data.userStatus.value : this.userStatus,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      farmSiteId:
          data.farmSiteId.present ? data.farmSiteId.value : this.farmSiteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('isCustomerUser: $isCustomerUser, ')
          ..write('username: $username, ')
          ..write('userPassword: $userPassword, ')
          ..write('userGivenName: $userGivenName, ')
          ..write('userEmailAddress: $userEmailAddress, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('userStatus: $userStatus, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('farmSiteId: $farmSiteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userId,
      isCustomerUser,
      username,
      userPassword,
      userGivenName,
      userEmailAddress,
      createdDate,
      createdUserId,
      modifiedDate,
      modifiedUserId,
      userStatus,
      isDeleted,
      farmSiteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.isCustomerUser == this.isCustomerUser &&
          other.username == this.username &&
          other.userPassword == this.userPassword &&
          other.userGivenName == this.userGivenName &&
          other.userEmailAddress == this.userEmailAddress &&
          other.createdDate == this.createdDate &&
          other.createdUserId == this.createdUserId &&
          other.modifiedDate == this.modifiedDate &&
          other.modifiedUserId == this.modifiedUserId &&
          other.userStatus == this.userStatus &&
          other.isDeleted == this.isDeleted &&
          other.farmSiteId == this.farmSiteId);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<bool> isCustomerUser;
  final Value<String> username;
  final Value<String> userPassword;
  final Value<String?> userGivenName;
  final Value<String?> userEmailAddress;
  final Value<DateTime?> createdDate;
  final Value<int?> createdUserId;
  final Value<DateTime?> modifiedDate;
  final Value<int?> modifiedUserId;
  final Value<String> userStatus;
  final Value<bool> isDeleted;
  final Value<int?> farmSiteId;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.isCustomerUser = const Value.absent(),
    this.username = const Value.absent(),
    this.userPassword = const Value.absent(),
    this.userGivenName = const Value.absent(),
    this.userEmailAddress = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.userStatus = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.farmSiteId = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    this.isCustomerUser = const Value.absent(),
    required String username,
    required String userPassword,
    this.userGivenName = const Value.absent(),
    this.userEmailAddress = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.userStatus = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.farmSiteId = const Value.absent(),
  })  : username = Value(username),
        userPassword = Value(userPassword);
  static Insertable<User> custom({
    Expression<int>? userId,
    Expression<bool>? isCustomerUser,
    Expression<String>? username,
    Expression<String>? userPassword,
    Expression<String>? userGivenName,
    Expression<String>? userEmailAddress,
    Expression<DateTime>? createdDate,
    Expression<int>? createdUserId,
    Expression<DateTime>? modifiedDate,
    Expression<int>? modifiedUserId,
    Expression<String>? userStatus,
    Expression<bool>? isDeleted,
    Expression<int>? farmSiteId,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (isCustomerUser != null) 'is_customer_user': isCustomerUser,
      if (username != null) 'username': username,
      if (userPassword != null) 'user_password': userPassword,
      if (userGivenName != null) 'user_given_name': userGivenName,
      if (userEmailAddress != null) 'user_email_address': userEmailAddress,
      if (createdDate != null) 'created_date': createdDate,
      if (createdUserId != null) 'created_user_id': createdUserId,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (modifiedUserId != null) 'modified_user_id': modifiedUserId,
      if (userStatus != null) 'user_status': userStatus,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (farmSiteId != null) 'farm_site_id': farmSiteId,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userId,
      Value<bool>? isCustomerUser,
      Value<String>? username,
      Value<String>? userPassword,
      Value<String?>? userGivenName,
      Value<String?>? userEmailAddress,
      Value<DateTime?>? createdDate,
      Value<int?>? createdUserId,
      Value<DateTime?>? modifiedDate,
      Value<int?>? modifiedUserId,
      Value<String>? userStatus,
      Value<bool>? isDeleted,
      Value<int?>? farmSiteId}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      isCustomerUser: isCustomerUser ?? this.isCustomerUser,
      username: username ?? this.username,
      userPassword: userPassword ?? this.userPassword,
      userGivenName: userGivenName ?? this.userGivenName,
      userEmailAddress: userEmailAddress ?? this.userEmailAddress,
      createdDate: createdDate ?? this.createdDate,
      createdUserId: createdUserId ?? this.createdUserId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedUserId: modifiedUserId ?? this.modifiedUserId,
      userStatus: userStatus ?? this.userStatus,
      isDeleted: isDeleted ?? this.isDeleted,
      farmSiteId: farmSiteId ?? this.farmSiteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (isCustomerUser.present) {
      map['is_customer_user'] = Variable<bool>(isCustomerUser.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (userPassword.present) {
      map['user_password'] = Variable<String>(userPassword.value);
    }
    if (userGivenName.present) {
      map['user_given_name'] = Variable<String>(userGivenName.value);
    }
    if (userEmailAddress.present) {
      map['user_email_address'] = Variable<String>(userEmailAddress.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (createdUserId.present) {
      map['created_user_id'] = Variable<int>(createdUserId.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (modifiedUserId.present) {
      map['modified_user_id'] = Variable<int>(modifiedUserId.value);
    }
    if (userStatus.present) {
      map['user_status'] = Variable<String>(userStatus.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (farmSiteId.present) {
      map['farm_site_id'] = Variable<int>(farmSiteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('isCustomerUser: $isCustomerUser, ')
          ..write('username: $username, ')
          ..write('userPassword: $userPassword, ')
          ..write('userGivenName: $userGivenName, ')
          ..write('userEmailAddress: $userEmailAddress, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('userStatus: $userStatus, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('farmSiteId: $farmSiteId')
          ..write(')'))
        .toString();
  }
}

class $CropsTable extends Crops with TableInfo<$CropsTable, Crop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CropsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cropIdMeta = const VerificationMeta('cropId');
  @override
  late final GeneratedColumn<int> cropId = GeneratedColumn<int>(
      'crop_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cropCodeMeta =
      const VerificationMeta('cropCode');
  @override
  late final GeneratedColumn<String> cropCode = GeneratedColumn<String>(
      'crop_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdUserIdMeta =
      const VerificationMeta('createdUserId');
  @override
  late final GeneratedColumn<int> createdUserId = GeneratedColumn<int>(
      'created_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedUserIdMeta =
      const VerificationMeta('modifiedUserId');
  @override
  late final GeneratedColumn<int> modifiedUserId = GeneratedColumn<int>(
      'modified_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        cropId,
        cropCode,
        createdDate,
        createdUserId,
        modifiedDate,
        modifiedUserId,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crops';
  @override
  VerificationContext validateIntegrity(Insertable<Crop> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('crop_id')) {
      context.handle(_cropIdMeta,
          cropId.isAcceptableOrUnknown(data['crop_id']!, _cropIdMeta));
    }
    if (data.containsKey('crop_code')) {
      context.handle(_cropCodeMeta,
          cropCode.isAcceptableOrUnknown(data['crop_code']!, _cropCodeMeta));
    } else if (isInserting) {
      context.missing(_cropCodeMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('created_user_id')) {
      context.handle(
          _createdUserIdMeta,
          createdUserId.isAcceptableOrUnknown(
              data['created_user_id']!, _createdUserIdMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('modified_user_id')) {
      context.handle(
          _modifiedUserIdMeta,
          modifiedUserId.isAcceptableOrUnknown(
              data['modified_user_id']!, _modifiedUserIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cropId};
  @override
  Crop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Crop(
      cropId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}crop_id'])!,
      cropCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}crop_code'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      createdUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_user_id']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      modifiedUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modified_user_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $CropsTable createAlias(String alias) {
    return $CropsTable(attachedDatabase, alias);
  }
}

class Crop extends DataClass implements Insertable<Crop> {
  final int cropId;
  final String cropCode;
  final DateTime? createdDate;
  final int? createdUserId;
  final DateTime? modifiedDate;
  final int? modifiedUserId;
  final bool isDeleted;
  const Crop(
      {required this.cropId,
      required this.cropCode,
      this.createdDate,
      this.createdUserId,
      this.modifiedDate,
      this.modifiedUserId,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['crop_id'] = Variable<int>(cropId);
    map['crop_code'] = Variable<String>(cropCode);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || createdUserId != null) {
      map['created_user_id'] = Variable<int>(createdUserId);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    if (!nullToAbsent || modifiedUserId != null) {
      map['modified_user_id'] = Variable<int>(modifiedUserId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  CropsCompanion toCompanion(bool nullToAbsent) {
    return CropsCompanion(
      cropId: Value(cropId),
      cropCode: Value(cropCode),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdUserId: createdUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdUserId),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      modifiedUserId: modifiedUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedUserId),
      isDeleted: Value(isDeleted),
    );
  }

  factory Crop.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Crop(
      cropId: serializer.fromJson<int>(json['cropId']),
      cropCode: serializer.fromJson<String>(json['cropCode']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      createdUserId: serializer.fromJson<int?>(json['createdUserId']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      modifiedUserId: serializer.fromJson<int?>(json['modifiedUserId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cropId': serializer.toJson<int>(cropId),
      'cropCode': serializer.toJson<String>(cropCode),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'createdUserId': serializer.toJson<int?>(createdUserId),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'modifiedUserId': serializer.toJson<int?>(modifiedUserId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  Crop copyWith(
          {int? cropId,
          String? cropCode,
          Value<DateTime?> createdDate = const Value.absent(),
          Value<int?> createdUserId = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          Value<int?> modifiedUserId = const Value.absent(),
          bool? isDeleted}) =>
      Crop(
        cropId: cropId ?? this.cropId,
        cropCode: cropCode ?? this.cropCode,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        createdUserId:
            createdUserId.present ? createdUserId.value : this.createdUserId,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        modifiedUserId:
            modifiedUserId.present ? modifiedUserId.value : this.modifiedUserId,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  Crop copyWithCompanion(CropsCompanion data) {
    return Crop(
      cropId: data.cropId.present ? data.cropId.value : this.cropId,
      cropCode: data.cropCode.present ? data.cropCode.value : this.cropCode,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      createdUserId: data.createdUserId.present
          ? data.createdUserId.value
          : this.createdUserId,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      modifiedUserId: data.modifiedUserId.present
          ? data.modifiedUserId.value
          : this.modifiedUserId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Crop(')
          ..write('cropId: $cropId, ')
          ..write('cropCode: $cropCode, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cropId, cropCode, createdDate, createdUserId,
      modifiedDate, modifiedUserId, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Crop &&
          other.cropId == this.cropId &&
          other.cropCode == this.cropCode &&
          other.createdDate == this.createdDate &&
          other.createdUserId == this.createdUserId &&
          other.modifiedDate == this.modifiedDate &&
          other.modifiedUserId == this.modifiedUserId &&
          other.isDeleted == this.isDeleted);
}

class CropsCompanion extends UpdateCompanion<Crop> {
  final Value<int> cropId;
  final Value<String> cropCode;
  final Value<DateTime?> createdDate;
  final Value<int?> createdUserId;
  final Value<DateTime?> modifiedDate;
  final Value<int?> modifiedUserId;
  final Value<bool> isDeleted;
  const CropsCompanion({
    this.cropId = const Value.absent(),
    this.cropCode = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  CropsCompanion.insert({
    this.cropId = const Value.absent(),
    required String cropCode,
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  }) : cropCode = Value(cropCode);
  static Insertable<Crop> custom({
    Expression<int>? cropId,
    Expression<String>? cropCode,
    Expression<DateTime>? createdDate,
    Expression<int>? createdUserId,
    Expression<DateTime>? modifiedDate,
    Expression<int>? modifiedUserId,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (cropId != null) 'crop_id': cropId,
      if (cropCode != null) 'crop_code': cropCode,
      if (createdDate != null) 'created_date': createdDate,
      if (createdUserId != null) 'created_user_id': createdUserId,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (modifiedUserId != null) 'modified_user_id': modifiedUserId,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  CropsCompanion copyWith(
      {Value<int>? cropId,
      Value<String>? cropCode,
      Value<DateTime?>? createdDate,
      Value<int?>? createdUserId,
      Value<DateTime?>? modifiedDate,
      Value<int?>? modifiedUserId,
      Value<bool>? isDeleted}) {
    return CropsCompanion(
      cropId: cropId ?? this.cropId,
      cropCode: cropCode ?? this.cropCode,
      createdDate: createdDate ?? this.createdDate,
      createdUserId: createdUserId ?? this.createdUserId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedUserId: modifiedUserId ?? this.modifiedUserId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cropId.present) {
      map['crop_id'] = Variable<int>(cropId.value);
    }
    if (cropCode.present) {
      map['crop_code'] = Variable<String>(cropCode.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (createdUserId.present) {
      map['created_user_id'] = Variable<int>(createdUserId.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (modifiedUserId.present) {
      map['modified_user_id'] = Variable<int>(modifiedUserId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CropsCompanion(')
          ..write('cropId: $cropId, ')
          ..write('cropCode: $cropCode, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $FarmSitesTable extends FarmSites
    with TableInfo<$FarmSitesTable, FarmSite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmSitesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _farmSiteIdMeta =
      const VerificationMeta('farmSiteId');
  @override
  late final GeneratedColumn<int> farmSiteId = GeneratedColumn<int>(
      'farm_site_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _farmSiteNameMeta =
      const VerificationMeta('farmSiteName');
  @override
  late final GeneratedColumn<String> farmSiteName = GeneratedColumn<String>(
      'farm_site_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdUserIdMeta =
      const VerificationMeta('createdUserId');
  @override
  late final GeneratedColumn<int> createdUserId = GeneratedColumn<int>(
      'created_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedUserIdMeta =
      const VerificationMeta('modifiedUserId');
  @override
  late final GeneratedColumn<int> modifiedUserId = GeneratedColumn<int>(
      'modified_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _defaultPrimaryCropIdMeta =
      const VerificationMeta('defaultPrimaryCropId');
  @override
  late final GeneratedColumn<int> defaultPrimaryCropId = GeneratedColumn<int>(
      'default_primary_crop_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES crops (crop_id)'));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        farmSiteId,
        farmSiteName,
        createdDate,
        createdUserId,
        modifiedDate,
        modifiedUserId,
        defaultPrimaryCropId,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_sites';
  @override
  VerificationContext validateIntegrity(Insertable<FarmSite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('farm_site_id')) {
      context.handle(
          _farmSiteIdMeta,
          farmSiteId.isAcceptableOrUnknown(
              data['farm_site_id']!, _farmSiteIdMeta));
    }
    if (data.containsKey('farm_site_name')) {
      context.handle(
          _farmSiteNameMeta,
          farmSiteName.isAcceptableOrUnknown(
              data['farm_site_name']!, _farmSiteNameMeta));
    } else if (isInserting) {
      context.missing(_farmSiteNameMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('created_user_id')) {
      context.handle(
          _createdUserIdMeta,
          createdUserId.isAcceptableOrUnknown(
              data['created_user_id']!, _createdUserIdMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('modified_user_id')) {
      context.handle(
          _modifiedUserIdMeta,
          modifiedUserId.isAcceptableOrUnknown(
              data['modified_user_id']!, _modifiedUserIdMeta));
    }
    if (data.containsKey('default_primary_crop_id')) {
      context.handle(
          _defaultPrimaryCropIdMeta,
          defaultPrimaryCropId.isAcceptableOrUnknown(
              data['default_primary_crop_id']!, _defaultPrimaryCropIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {farmSiteId};
  @override
  FarmSite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmSite(
      farmSiteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}farm_site_id'])!,
      farmSiteName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}farm_site_name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      createdUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_user_id']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      modifiedUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modified_user_id']),
      defaultPrimaryCropId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}default_primary_crop_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $FarmSitesTable createAlias(String alias) {
    return $FarmSitesTable(attachedDatabase, alias);
  }
}

class FarmSite extends DataClass implements Insertable<FarmSite> {
  final int farmSiteId;
  final String farmSiteName;
  final DateTime? createdDate;
  final int? createdUserId;
  final DateTime? modifiedDate;
  final int? modifiedUserId;
  final int? defaultPrimaryCropId;
  final bool isDeleted;
  const FarmSite(
      {required this.farmSiteId,
      required this.farmSiteName,
      this.createdDate,
      this.createdUserId,
      this.modifiedDate,
      this.modifiedUserId,
      this.defaultPrimaryCropId,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['farm_site_id'] = Variable<int>(farmSiteId);
    map['farm_site_name'] = Variable<String>(farmSiteName);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || createdUserId != null) {
      map['created_user_id'] = Variable<int>(createdUserId);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    if (!nullToAbsent || modifiedUserId != null) {
      map['modified_user_id'] = Variable<int>(modifiedUserId);
    }
    if (!nullToAbsent || defaultPrimaryCropId != null) {
      map['default_primary_crop_id'] = Variable<int>(defaultPrimaryCropId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  FarmSitesCompanion toCompanion(bool nullToAbsent) {
    return FarmSitesCompanion(
      farmSiteId: Value(farmSiteId),
      farmSiteName: Value(farmSiteName),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdUserId: createdUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdUserId),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      modifiedUserId: modifiedUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedUserId),
      defaultPrimaryCropId: defaultPrimaryCropId == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultPrimaryCropId),
      isDeleted: Value(isDeleted),
    );
  }

  factory FarmSite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmSite(
      farmSiteId: serializer.fromJson<int>(json['farmSiteId']),
      farmSiteName: serializer.fromJson<String>(json['farmSiteName']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      createdUserId: serializer.fromJson<int?>(json['createdUserId']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      modifiedUserId: serializer.fromJson<int?>(json['modifiedUserId']),
      defaultPrimaryCropId:
          serializer.fromJson<int?>(json['defaultPrimaryCropId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'farmSiteId': serializer.toJson<int>(farmSiteId),
      'farmSiteName': serializer.toJson<String>(farmSiteName),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'createdUserId': serializer.toJson<int?>(createdUserId),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'modifiedUserId': serializer.toJson<int?>(modifiedUserId),
      'defaultPrimaryCropId': serializer.toJson<int?>(defaultPrimaryCropId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  FarmSite copyWith(
          {int? farmSiteId,
          String? farmSiteName,
          Value<DateTime?> createdDate = const Value.absent(),
          Value<int?> createdUserId = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          Value<int?> modifiedUserId = const Value.absent(),
          Value<int?> defaultPrimaryCropId = const Value.absent(),
          bool? isDeleted}) =>
      FarmSite(
        farmSiteId: farmSiteId ?? this.farmSiteId,
        farmSiteName: farmSiteName ?? this.farmSiteName,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        createdUserId:
            createdUserId.present ? createdUserId.value : this.createdUserId,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        modifiedUserId:
            modifiedUserId.present ? modifiedUserId.value : this.modifiedUserId,
        defaultPrimaryCropId: defaultPrimaryCropId.present
            ? defaultPrimaryCropId.value
            : this.defaultPrimaryCropId,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  FarmSite copyWithCompanion(FarmSitesCompanion data) {
    return FarmSite(
      farmSiteId:
          data.farmSiteId.present ? data.farmSiteId.value : this.farmSiteId,
      farmSiteName: data.farmSiteName.present
          ? data.farmSiteName.value
          : this.farmSiteName,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      createdUserId: data.createdUserId.present
          ? data.createdUserId.value
          : this.createdUserId,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      modifiedUserId: data.modifiedUserId.present
          ? data.modifiedUserId.value
          : this.modifiedUserId,
      defaultPrimaryCropId: data.defaultPrimaryCropId.present
          ? data.defaultPrimaryCropId.value
          : this.defaultPrimaryCropId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmSite(')
          ..write('farmSiteId: $farmSiteId, ')
          ..write('farmSiteName: $farmSiteName, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('defaultPrimaryCropId: $defaultPrimaryCropId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      farmSiteId,
      farmSiteName,
      createdDate,
      createdUserId,
      modifiedDate,
      modifiedUserId,
      defaultPrimaryCropId,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmSite &&
          other.farmSiteId == this.farmSiteId &&
          other.farmSiteName == this.farmSiteName &&
          other.createdDate == this.createdDate &&
          other.createdUserId == this.createdUserId &&
          other.modifiedDate == this.modifiedDate &&
          other.modifiedUserId == this.modifiedUserId &&
          other.defaultPrimaryCropId == this.defaultPrimaryCropId &&
          other.isDeleted == this.isDeleted);
}

class FarmSitesCompanion extends UpdateCompanion<FarmSite> {
  final Value<int> farmSiteId;
  final Value<String> farmSiteName;
  final Value<DateTime?> createdDate;
  final Value<int?> createdUserId;
  final Value<DateTime?> modifiedDate;
  final Value<int?> modifiedUserId;
  final Value<int?> defaultPrimaryCropId;
  final Value<bool> isDeleted;
  const FarmSitesCompanion({
    this.farmSiteId = const Value.absent(),
    this.farmSiteName = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.defaultPrimaryCropId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  FarmSitesCompanion.insert({
    this.farmSiteId = const Value.absent(),
    required String farmSiteName,
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.defaultPrimaryCropId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  }) : farmSiteName = Value(farmSiteName);
  static Insertable<FarmSite> custom({
    Expression<int>? farmSiteId,
    Expression<String>? farmSiteName,
    Expression<DateTime>? createdDate,
    Expression<int>? createdUserId,
    Expression<DateTime>? modifiedDate,
    Expression<int>? modifiedUserId,
    Expression<int>? defaultPrimaryCropId,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (farmSiteId != null) 'farm_site_id': farmSiteId,
      if (farmSiteName != null) 'farm_site_name': farmSiteName,
      if (createdDate != null) 'created_date': createdDate,
      if (createdUserId != null) 'created_user_id': createdUserId,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (modifiedUserId != null) 'modified_user_id': modifiedUserId,
      if (defaultPrimaryCropId != null)
        'default_primary_crop_id': defaultPrimaryCropId,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  FarmSitesCompanion copyWith(
      {Value<int>? farmSiteId,
      Value<String>? farmSiteName,
      Value<DateTime?>? createdDate,
      Value<int?>? createdUserId,
      Value<DateTime?>? modifiedDate,
      Value<int?>? modifiedUserId,
      Value<int?>? defaultPrimaryCropId,
      Value<bool>? isDeleted}) {
    return FarmSitesCompanion(
      farmSiteId: farmSiteId ?? this.farmSiteId,
      farmSiteName: farmSiteName ?? this.farmSiteName,
      createdDate: createdDate ?? this.createdDate,
      createdUserId: createdUserId ?? this.createdUserId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedUserId: modifiedUserId ?? this.modifiedUserId,
      defaultPrimaryCropId: defaultPrimaryCropId ?? this.defaultPrimaryCropId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (farmSiteId.present) {
      map['farm_site_id'] = Variable<int>(farmSiteId.value);
    }
    if (farmSiteName.present) {
      map['farm_site_name'] = Variable<String>(farmSiteName.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (createdUserId.present) {
      map['created_user_id'] = Variable<int>(createdUserId.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (modifiedUserId.present) {
      map['modified_user_id'] = Variable<int>(modifiedUserId.value);
    }
    if (defaultPrimaryCropId.present) {
      map['default_primary_crop_id'] =
          Variable<int>(defaultPrimaryCropId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmSitesCompanion(')
          ..write('farmSiteId: $farmSiteId, ')
          ..write('farmSiteName: $farmSiteName, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('defaultPrimaryCropId: $defaultPrimaryCropId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $FarmFieldsTable extends FarmFields
    with TableInfo<$FarmFieldsTable, FarmField> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmFieldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _farmFieldIdMeta =
      const VerificationMeta('farmFieldId');
  @override
  late final GeneratedColumn<int> farmFieldId = GeneratedColumn<int>(
      'farm_field_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _farmSiteIdMeta =
      const VerificationMeta('farmSiteId');
  @override
  late final GeneratedColumn<int> farmSiteId = GeneratedColumn<int>(
      'farm_site_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES farm_sites (farm_site_id)'));
  static const VerificationMeta _farmFieldNameMeta =
      const VerificationMeta('farmFieldName');
  @override
  late final GeneratedColumn<String> farmFieldName = GeneratedColumn<String>(
      'farm_field_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _farmFieldCodeMeta =
      const VerificationMeta('farmFieldCode');
  @override
  late final GeneratedColumn<String> farmFieldCode = GeneratedColumn<String>(
      'farm_field_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rowWidthMeta =
      const VerificationMeta('rowWidth');
  @override
  late final GeneratedColumn<double> rowWidth = GeneratedColumn<double>(
      'row_width', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _farmFieldRowDirectionMeta =
      const VerificationMeta('farmFieldRowDirection');
  @override
  late final GeneratedColumn<String> farmFieldRowDirection =
      GeneratedColumn<String>('farm_field_row_direction', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _farmFieldColorHexCodeMeta =
      const VerificationMeta('farmFieldColorHexCode');
  @override
  late final GeneratedColumn<String> farmFieldColorHexCode =
      GeneratedColumn<String>('farm_field_color_hex_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdUserIdMeta =
      const VerificationMeta('createdUserId');
  @override
  late final GeneratedColumn<int> createdUserId = GeneratedColumn<int>(
      'created_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedUserIdMeta =
      const VerificationMeta('modifiedUserId');
  @override
  late final GeneratedColumn<int> modifiedUserId = GeneratedColumn<int>(
      'modified_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        farmFieldId,
        farmSiteId,
        farmFieldName,
        farmFieldCode,
        rowWidth,
        farmFieldRowDirection,
        farmFieldColorHexCode,
        createdDate,
        createdUserId,
        modifiedDate,
        modifiedUserId,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_fields';
  @override
  VerificationContext validateIntegrity(Insertable<FarmField> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('farm_field_id')) {
      context.handle(
          _farmFieldIdMeta,
          farmFieldId.isAcceptableOrUnknown(
              data['farm_field_id']!, _farmFieldIdMeta));
    }
    if (data.containsKey('farm_site_id')) {
      context.handle(
          _farmSiteIdMeta,
          farmSiteId.isAcceptableOrUnknown(
              data['farm_site_id']!, _farmSiteIdMeta));
    } else if (isInserting) {
      context.missing(_farmSiteIdMeta);
    }
    if (data.containsKey('farm_field_name')) {
      context.handle(
          _farmFieldNameMeta,
          farmFieldName.isAcceptableOrUnknown(
              data['farm_field_name']!, _farmFieldNameMeta));
    } else if (isInserting) {
      context.missing(_farmFieldNameMeta);
    }
    if (data.containsKey('farm_field_code')) {
      context.handle(
          _farmFieldCodeMeta,
          farmFieldCode.isAcceptableOrUnknown(
              data['farm_field_code']!, _farmFieldCodeMeta));
    }
    if (data.containsKey('row_width')) {
      context.handle(_rowWidthMeta,
          rowWidth.isAcceptableOrUnknown(data['row_width']!, _rowWidthMeta));
    }
    if (data.containsKey('farm_field_row_direction')) {
      context.handle(
          _farmFieldRowDirectionMeta,
          farmFieldRowDirection.isAcceptableOrUnknown(
              data['farm_field_row_direction']!, _farmFieldRowDirectionMeta));
    }
    if (data.containsKey('farm_field_color_hex_code')) {
      context.handle(
          _farmFieldColorHexCodeMeta,
          farmFieldColorHexCode.isAcceptableOrUnknown(
              data['farm_field_color_hex_code']!, _farmFieldColorHexCodeMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('created_user_id')) {
      context.handle(
          _createdUserIdMeta,
          createdUserId.isAcceptableOrUnknown(
              data['created_user_id']!, _createdUserIdMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('modified_user_id')) {
      context.handle(
          _modifiedUserIdMeta,
          modifiedUserId.isAcceptableOrUnknown(
              data['modified_user_id']!, _modifiedUserIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {farmFieldId};
  @override
  FarmField map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmField(
      farmFieldId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}farm_field_id'])!,
      farmSiteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}farm_site_id'])!,
      farmFieldName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}farm_field_name'])!,
      farmFieldCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}farm_field_code']),
      rowWidth: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}row_width']),
      farmFieldRowDirection: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}farm_field_row_direction']),
      farmFieldColorHexCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}farm_field_color_hex_code']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      createdUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_user_id']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      modifiedUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modified_user_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $FarmFieldsTable createAlias(String alias) {
    return $FarmFieldsTable(attachedDatabase, alias);
  }
}

class FarmField extends DataClass implements Insertable<FarmField> {
  final int farmFieldId;
  final int farmSiteId;
  final String farmFieldName;
  final String? farmFieldCode;
  final double? rowWidth;
  final String? farmFieldRowDirection;
  final String? farmFieldColorHexCode;
  final DateTime? createdDate;
  final int? createdUserId;
  final DateTime? modifiedDate;
  final int? modifiedUserId;
  final bool isDeleted;
  const FarmField(
      {required this.farmFieldId,
      required this.farmSiteId,
      required this.farmFieldName,
      this.farmFieldCode,
      this.rowWidth,
      this.farmFieldRowDirection,
      this.farmFieldColorHexCode,
      this.createdDate,
      this.createdUserId,
      this.modifiedDate,
      this.modifiedUserId,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['farm_field_id'] = Variable<int>(farmFieldId);
    map['farm_site_id'] = Variable<int>(farmSiteId);
    map['farm_field_name'] = Variable<String>(farmFieldName);
    if (!nullToAbsent || farmFieldCode != null) {
      map['farm_field_code'] = Variable<String>(farmFieldCode);
    }
    if (!nullToAbsent || rowWidth != null) {
      map['row_width'] = Variable<double>(rowWidth);
    }
    if (!nullToAbsent || farmFieldRowDirection != null) {
      map['farm_field_row_direction'] = Variable<String>(farmFieldRowDirection);
    }
    if (!nullToAbsent || farmFieldColorHexCode != null) {
      map['farm_field_color_hex_code'] =
          Variable<String>(farmFieldColorHexCode);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || createdUserId != null) {
      map['created_user_id'] = Variable<int>(createdUserId);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    if (!nullToAbsent || modifiedUserId != null) {
      map['modified_user_id'] = Variable<int>(modifiedUserId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  FarmFieldsCompanion toCompanion(bool nullToAbsent) {
    return FarmFieldsCompanion(
      farmFieldId: Value(farmFieldId),
      farmSiteId: Value(farmSiteId),
      farmFieldName: Value(farmFieldName),
      farmFieldCode: farmFieldCode == null && nullToAbsent
          ? const Value.absent()
          : Value(farmFieldCode),
      rowWidth: rowWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(rowWidth),
      farmFieldRowDirection: farmFieldRowDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(farmFieldRowDirection),
      farmFieldColorHexCode: farmFieldColorHexCode == null && nullToAbsent
          ? const Value.absent()
          : Value(farmFieldColorHexCode),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdUserId: createdUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdUserId),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      modifiedUserId: modifiedUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedUserId),
      isDeleted: Value(isDeleted),
    );
  }

  factory FarmField.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmField(
      farmFieldId: serializer.fromJson<int>(json['farmFieldId']),
      farmSiteId: serializer.fromJson<int>(json['farmSiteId']),
      farmFieldName: serializer.fromJson<String>(json['farmFieldName']),
      farmFieldCode: serializer.fromJson<String?>(json['farmFieldCode']),
      rowWidth: serializer.fromJson<double?>(json['rowWidth']),
      farmFieldRowDirection:
          serializer.fromJson<String?>(json['farmFieldRowDirection']),
      farmFieldColorHexCode:
          serializer.fromJson<String?>(json['farmFieldColorHexCode']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      createdUserId: serializer.fromJson<int?>(json['createdUserId']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      modifiedUserId: serializer.fromJson<int?>(json['modifiedUserId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'farmFieldId': serializer.toJson<int>(farmFieldId),
      'farmSiteId': serializer.toJson<int>(farmSiteId),
      'farmFieldName': serializer.toJson<String>(farmFieldName),
      'farmFieldCode': serializer.toJson<String?>(farmFieldCode),
      'rowWidth': serializer.toJson<double?>(rowWidth),
      'farmFieldRowDirection':
          serializer.toJson<String?>(farmFieldRowDirection),
      'farmFieldColorHexCode':
          serializer.toJson<String?>(farmFieldColorHexCode),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'createdUserId': serializer.toJson<int?>(createdUserId),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'modifiedUserId': serializer.toJson<int?>(modifiedUserId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  FarmField copyWith(
          {int? farmFieldId,
          int? farmSiteId,
          String? farmFieldName,
          Value<String?> farmFieldCode = const Value.absent(),
          Value<double?> rowWidth = const Value.absent(),
          Value<String?> farmFieldRowDirection = const Value.absent(),
          Value<String?> farmFieldColorHexCode = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent(),
          Value<int?> createdUserId = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          Value<int?> modifiedUserId = const Value.absent(),
          bool? isDeleted}) =>
      FarmField(
        farmFieldId: farmFieldId ?? this.farmFieldId,
        farmSiteId: farmSiteId ?? this.farmSiteId,
        farmFieldName: farmFieldName ?? this.farmFieldName,
        farmFieldCode:
            farmFieldCode.present ? farmFieldCode.value : this.farmFieldCode,
        rowWidth: rowWidth.present ? rowWidth.value : this.rowWidth,
        farmFieldRowDirection: farmFieldRowDirection.present
            ? farmFieldRowDirection.value
            : this.farmFieldRowDirection,
        farmFieldColorHexCode: farmFieldColorHexCode.present
            ? farmFieldColorHexCode.value
            : this.farmFieldColorHexCode,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        createdUserId:
            createdUserId.present ? createdUserId.value : this.createdUserId,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        modifiedUserId:
            modifiedUserId.present ? modifiedUserId.value : this.modifiedUserId,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  FarmField copyWithCompanion(FarmFieldsCompanion data) {
    return FarmField(
      farmFieldId:
          data.farmFieldId.present ? data.farmFieldId.value : this.farmFieldId,
      farmSiteId:
          data.farmSiteId.present ? data.farmSiteId.value : this.farmSiteId,
      farmFieldName: data.farmFieldName.present
          ? data.farmFieldName.value
          : this.farmFieldName,
      farmFieldCode: data.farmFieldCode.present
          ? data.farmFieldCode.value
          : this.farmFieldCode,
      rowWidth: data.rowWidth.present ? data.rowWidth.value : this.rowWidth,
      farmFieldRowDirection: data.farmFieldRowDirection.present
          ? data.farmFieldRowDirection.value
          : this.farmFieldRowDirection,
      farmFieldColorHexCode: data.farmFieldColorHexCode.present
          ? data.farmFieldColorHexCode.value
          : this.farmFieldColorHexCode,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      createdUserId: data.createdUserId.present
          ? data.createdUserId.value
          : this.createdUserId,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      modifiedUserId: data.modifiedUserId.present
          ? data.modifiedUserId.value
          : this.modifiedUserId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmField(')
          ..write('farmFieldId: $farmFieldId, ')
          ..write('farmSiteId: $farmSiteId, ')
          ..write('farmFieldName: $farmFieldName, ')
          ..write('farmFieldCode: $farmFieldCode, ')
          ..write('rowWidth: $rowWidth, ')
          ..write('farmFieldRowDirection: $farmFieldRowDirection, ')
          ..write('farmFieldColorHexCode: $farmFieldColorHexCode, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      farmFieldId,
      farmSiteId,
      farmFieldName,
      farmFieldCode,
      rowWidth,
      farmFieldRowDirection,
      farmFieldColorHexCode,
      createdDate,
      createdUserId,
      modifiedDate,
      modifiedUserId,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmField &&
          other.farmFieldId == this.farmFieldId &&
          other.farmSiteId == this.farmSiteId &&
          other.farmFieldName == this.farmFieldName &&
          other.farmFieldCode == this.farmFieldCode &&
          other.rowWidth == this.rowWidth &&
          other.farmFieldRowDirection == this.farmFieldRowDirection &&
          other.farmFieldColorHexCode == this.farmFieldColorHexCode &&
          other.createdDate == this.createdDate &&
          other.createdUserId == this.createdUserId &&
          other.modifiedDate == this.modifiedDate &&
          other.modifiedUserId == this.modifiedUserId &&
          other.isDeleted == this.isDeleted);
}

class FarmFieldsCompanion extends UpdateCompanion<FarmField> {
  final Value<int> farmFieldId;
  final Value<int> farmSiteId;
  final Value<String> farmFieldName;
  final Value<String?> farmFieldCode;
  final Value<double?> rowWidth;
  final Value<String?> farmFieldRowDirection;
  final Value<String?> farmFieldColorHexCode;
  final Value<DateTime?> createdDate;
  final Value<int?> createdUserId;
  final Value<DateTime?> modifiedDate;
  final Value<int?> modifiedUserId;
  final Value<bool> isDeleted;
  const FarmFieldsCompanion({
    this.farmFieldId = const Value.absent(),
    this.farmSiteId = const Value.absent(),
    this.farmFieldName = const Value.absent(),
    this.farmFieldCode = const Value.absent(),
    this.rowWidth = const Value.absent(),
    this.farmFieldRowDirection = const Value.absent(),
    this.farmFieldColorHexCode = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  FarmFieldsCompanion.insert({
    this.farmFieldId = const Value.absent(),
    required int farmSiteId,
    required String farmFieldName,
    this.farmFieldCode = const Value.absent(),
    this.rowWidth = const Value.absent(),
    this.farmFieldRowDirection = const Value.absent(),
    this.farmFieldColorHexCode = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isDeleted = const Value.absent(), required Value<String?> description, required Value<int?> primaryCropId,
  })  : farmSiteId = Value(farmSiteId),
        farmFieldName = Value(farmFieldName);
  static Insertable<FarmField> custom({
    Expression<int>? farmFieldId,
    Expression<int>? farmSiteId,
    Expression<String>? farmFieldName,
    Expression<String>? farmFieldCode,
    Expression<double>? rowWidth,
    Expression<String>? farmFieldRowDirection,
    Expression<String>? farmFieldColorHexCode,
    Expression<DateTime>? createdDate,
    Expression<int>? createdUserId,
    Expression<DateTime>? modifiedDate,
    Expression<int>? modifiedUserId,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (farmFieldId != null) 'farm_field_id': farmFieldId,
      if (farmSiteId != null) 'farm_site_id': farmSiteId,
      if (farmFieldName != null) 'farm_field_name': farmFieldName,
      if (farmFieldCode != null) 'farm_field_code': farmFieldCode,
      if (rowWidth != null) 'row_width': rowWidth,
      if (farmFieldRowDirection != null)
        'farm_field_row_direction': farmFieldRowDirection,
      if (farmFieldColorHexCode != null)
        'farm_field_color_hex_code': farmFieldColorHexCode,
      if (createdDate != null) 'created_date': createdDate,
      if (createdUserId != null) 'created_user_id': createdUserId,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (modifiedUserId != null) 'modified_user_id': modifiedUserId,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  FarmFieldsCompanion copyWith(
      {Value<int>? farmFieldId,
      Value<int>? farmSiteId,
      Value<String>? farmFieldName,
      Value<String?>? farmFieldCode,
      Value<double?>? rowWidth,
      Value<String?>? farmFieldRowDirection,
      Value<String?>? farmFieldColorHexCode,
      Value<DateTime?>? createdDate,
      Value<int?>? createdUserId,
      Value<DateTime?>? modifiedDate,
      Value<int?>? modifiedUserId,
      Value<bool>? isDeleted}) {
    return FarmFieldsCompanion(
      farmFieldId: farmFieldId ?? this.farmFieldId,
      farmSiteId: farmSiteId ?? this.farmSiteId,
      farmFieldName: farmFieldName ?? this.farmFieldName,
      farmFieldCode: farmFieldCode ?? this.farmFieldCode,
      rowWidth: rowWidth ?? this.rowWidth,
      farmFieldRowDirection:
          farmFieldRowDirection ?? this.farmFieldRowDirection,
      farmFieldColorHexCode:
          farmFieldColorHexCode ?? this.farmFieldColorHexCode,
      createdDate: createdDate ?? this.createdDate,
      createdUserId: createdUserId ?? this.createdUserId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedUserId: modifiedUserId ?? this.modifiedUserId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (farmFieldId.present) {
      map['farm_field_id'] = Variable<int>(farmFieldId.value);
    }
    if (farmSiteId.present) {
      map['farm_site_id'] = Variable<int>(farmSiteId.value);
    }
    if (farmFieldName.present) {
      map['farm_field_name'] = Variable<String>(farmFieldName.value);
    }
    if (farmFieldCode.present) {
      map['farm_field_code'] = Variable<String>(farmFieldCode.value);
    }
    if (rowWidth.present) {
      map['row_width'] = Variable<double>(rowWidth.value);
    }
    if (farmFieldRowDirection.present) {
      map['farm_field_row_direction'] =
          Variable<String>(farmFieldRowDirection.value);
    }
    if (farmFieldColorHexCode.present) {
      map['farm_field_color_hex_code'] =
          Variable<String>(farmFieldColorHexCode.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (createdUserId.present) {
      map['created_user_id'] = Variable<int>(createdUserId.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (modifiedUserId.present) {
      map['modified_user_id'] = Variable<int>(modifiedUserId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmFieldsCompanion(')
          ..write('farmFieldId: $farmFieldId, ')
          ..write('farmSiteId: $farmSiteId, ')
          ..write('farmFieldName: $farmFieldName, ')
          ..write('farmFieldCode: $farmFieldCode, ')
          ..write('rowWidth: $rowWidth, ')
          ..write('farmFieldRowDirection: $farmFieldRowDirection, ')
          ..write('farmFieldColorHexCode: $farmFieldColorHexCode, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $WorkTaskTypesTable extends WorkTaskTypes
    with TableInfo<$WorkTaskTypesTable, WorkTaskType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkTaskTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workTaskTypeCodeMeta =
      const VerificationMeta('workTaskTypeCode');
  @override
  late final GeneratedColumn<String> workTaskTypeCode = GeneratedColumn<String>(
      'work_task_type_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdUserIdMeta =
      const VerificationMeta('createdUserId');
  @override
  late final GeneratedColumn<int> createdUserId = GeneratedColumn<int>(
      'created_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedUserIdMeta =
      const VerificationMeta('modifiedUserId');
  @override
  late final GeneratedColumn<int> modifiedUserId = GeneratedColumn<int>(
      'modified_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        workTaskTypeCode,
        createdDate,
        createdUserId,
        modifiedDate,
        modifiedUserId,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_task_types';
  @override
  VerificationContext validateIntegrity(Insertable<WorkTaskType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_task_type_code')) {
      context.handle(
          _workTaskTypeCodeMeta,
          workTaskTypeCode.isAcceptableOrUnknown(
              data['work_task_type_code']!, _workTaskTypeCodeMeta));
    } else if (isInserting) {
      context.missing(_workTaskTypeCodeMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('created_user_id')) {
      context.handle(
          _createdUserIdMeta,
          createdUserId.isAcceptableOrUnknown(
              data['created_user_id']!, _createdUserIdMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('modified_user_id')) {
      context.handle(
          _modifiedUserIdMeta,
          modifiedUserId.isAcceptableOrUnknown(
              data['modified_user_id']!, _modifiedUserIdMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workTaskTypeCode};
  @override
  WorkTaskType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkTaskType(
      workTaskTypeCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}work_task_type_code'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      createdUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_user_id']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      modifiedUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modified_user_id']),
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $WorkTaskTypesTable createAlias(String alias) {
    return $WorkTaskTypesTable(attachedDatabase, alias);
  }
}

class WorkTaskType extends DataClass implements Insertable<WorkTaskType> {
  final String workTaskTypeCode;
  final DateTime? createdDate;
  final int? createdUserId;
  final DateTime? modifiedDate;
  final int? modifiedUserId;
  final bool isDeleted;
  const WorkTaskType(
      {required this.workTaskTypeCode,
      this.createdDate,
      this.createdUserId,
      this.modifiedDate,
      this.modifiedUserId,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_task_type_code'] = Variable<String>(workTaskTypeCode);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || createdUserId != null) {
      map['created_user_id'] = Variable<int>(createdUserId);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    if (!nullToAbsent || modifiedUserId != null) {
      map['modified_user_id'] = Variable<int>(modifiedUserId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  WorkTaskTypesCompanion toCompanion(bool nullToAbsent) {
    return WorkTaskTypesCompanion(
      workTaskTypeCode: Value(workTaskTypeCode),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdUserId: createdUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdUserId),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      modifiedUserId: modifiedUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedUserId),
      isDeleted: Value(isDeleted),
    );
  }

  factory WorkTaskType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkTaskType(
      workTaskTypeCode: serializer.fromJson<String>(json['workTaskTypeCode']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      createdUserId: serializer.fromJson<int?>(json['createdUserId']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      modifiedUserId: serializer.fromJson<int?>(json['modifiedUserId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workTaskTypeCode': serializer.toJson<String>(workTaskTypeCode),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'createdUserId': serializer.toJson<int?>(createdUserId),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'modifiedUserId': serializer.toJson<int?>(modifiedUserId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  WorkTaskType copyWith(
          {String? workTaskTypeCode,
          Value<DateTime?> createdDate = const Value.absent(),
          Value<int?> createdUserId = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          Value<int?> modifiedUserId = const Value.absent(),
          bool? isDeleted}) =>
      WorkTaskType(
        workTaskTypeCode: workTaskTypeCode ?? this.workTaskTypeCode,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        createdUserId:
            createdUserId.present ? createdUserId.value : this.createdUserId,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        modifiedUserId:
            modifiedUserId.present ? modifiedUserId.value : this.modifiedUserId,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  WorkTaskType copyWithCompanion(WorkTaskTypesCompanion data) {
    return WorkTaskType(
      workTaskTypeCode: data.workTaskTypeCode.present
          ? data.workTaskTypeCode.value
          : this.workTaskTypeCode,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      createdUserId: data.createdUserId.present
          ? data.createdUserId.value
          : this.createdUserId,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      modifiedUserId: data.modifiedUserId.present
          ? data.modifiedUserId.value
          : this.modifiedUserId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkTaskType(')
          ..write('workTaskTypeCode: $workTaskTypeCode, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workTaskTypeCode, createdDate, createdUserId,
      modifiedDate, modifiedUserId, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkTaskType &&
          other.workTaskTypeCode == this.workTaskTypeCode &&
          other.createdDate == this.createdDate &&
          other.createdUserId == this.createdUserId &&
          other.modifiedDate == this.modifiedDate &&
          other.modifiedUserId == this.modifiedUserId &&
          other.isDeleted == this.isDeleted);
}

class WorkTaskTypesCompanion extends UpdateCompanion<WorkTaskType> {
  final Value<String> workTaskTypeCode;
  final Value<DateTime?> createdDate;
  final Value<int?> createdUserId;
  final Value<DateTime?> modifiedDate;
  final Value<int?> modifiedUserId;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const WorkTaskTypesCompanion({
    this.workTaskTypeCode = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkTaskTypesCompanion.insert({
    required String workTaskTypeCode,
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : workTaskTypeCode = Value(workTaskTypeCode);
  static Insertable<WorkTaskType> custom({
    Expression<String>? workTaskTypeCode,
    Expression<DateTime>? createdDate,
    Expression<int>? createdUserId,
    Expression<DateTime>? modifiedDate,
    Expression<int>? modifiedUserId,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workTaskTypeCode != null) 'work_task_type_code': workTaskTypeCode,
      if (createdDate != null) 'created_date': createdDate,
      if (createdUserId != null) 'created_user_id': createdUserId,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (modifiedUserId != null) 'modified_user_id': modifiedUserId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkTaskTypesCompanion copyWith(
      {Value<String>? workTaskTypeCode,
      Value<DateTime?>? createdDate,
      Value<int?>? createdUserId,
      Value<DateTime?>? modifiedDate,
      Value<int?>? modifiedUserId,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return WorkTaskTypesCompanion(
      workTaskTypeCode: workTaskTypeCode ?? this.workTaskTypeCode,
      createdDate: createdDate ?? this.createdDate,
      createdUserId: createdUserId ?? this.createdUserId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedUserId: modifiedUserId ?? this.modifiedUserId,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workTaskTypeCode.present) {
      map['work_task_type_code'] = Variable<String>(workTaskTypeCode.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (createdUserId.present) {
      map['created_user_id'] = Variable<int>(createdUserId.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (modifiedUserId.present) {
      map['modified_user_id'] = Variable<int>(modifiedUserId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkTaskTypesCompanion(')
          ..write('workTaskTypeCode: $workTaskTypeCode, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkTasksTable extends WorkTasks
    with TableInfo<$WorkTasksTable, WorkTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workTaskIdMeta =
      const VerificationMeta('workTaskId');
  @override
  late final GeneratedColumn<int> workTaskId = GeneratedColumn<int>(
      'work_task_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _farmFieldIdMeta =
      const VerificationMeta('farmFieldId');
  @override
  late final GeneratedColumn<int> farmFieldId = GeneratedColumn<int>(
      'farm_field_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES farm_fields (farm_field_id)'));
  static const VerificationMeta _workTaskTypeCodeMeta =
      const VerificationMeta('workTaskTypeCode');
  @override
  late final GeneratedColumn<String> workTaskTypeCode = GeneratedColumn<String>(
      'work_task_type_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES work_task_types (work_task_type_code)'));
  static const VerificationMeta _workTaskStatusCodeMeta =
      const VerificationMeta('workTaskStatusCode');
  @override
  late final GeneratedColumn<String> workTaskStatusCode =
      GeneratedColumn<String>('work_task_status_code', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
      defaultValue: const Constant(status.kStatusOpen));
  static const VerificationMeta _taskNameMeta =
      const VerificationMeta('taskName');
  @override
  late final GeneratedColumn<String> taskName = GeneratedColumn<String>(
      'task_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _instructionMeta =
      const VerificationMeta('instruction');
  @override
  late final GeneratedColumn<String> instruction = GeneratedColumn<String>(
      'instruction', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dueTypeMeta =
      const VerificationMeta('dueType');
  @override
  late final GeneratedColumn<String> dueType = GeneratedColumn<String>(
      'due_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentUriMeta =
      const VerificationMeta('attachmentUri');
  @override
  late final GeneratedColumn<String> attachmentUri = GeneratedColumn<String>(
      'attachment_uri', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startedDateMeta =
      const VerificationMeta('startedDate');
  @override
  late final GeneratedColumn<DateTime> startedDate = GeneratedColumn<DateTime>(
      'started_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cancelledDateMeta =
      const VerificationMeta('cancelledDate');
  @override
  late final GeneratedColumn<DateTime> cancelledDate =
      GeneratedColumn<DateTime>('cancelled_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdUserIdMeta =
      const VerificationMeta('createdUserId');
  @override
  late final GeneratedColumn<int> createdUserId = GeneratedColumn<int>(
      'created_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _modifiedUserIdMeta =
      const VerificationMeta('modifiedUserId');
  @override
  late final GeneratedColumn<int> modifiedUserId = GeneratedColumn<int>(
      'modified_user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (user_id)'));
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isStartedMeta =
      const VerificationMeta('isStarted');
  @override
  late final GeneratedColumn<bool> isStarted = GeneratedColumn<bool>(
      'is_started', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_started" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isCancelledMeta =
      const VerificationMeta('isCancelled');
  @override
  late final GeneratedColumn<bool> isCancelled = GeneratedColumn<bool>(
      'is_cancelled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_cancelled" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        workTaskId,
        farmFieldId,
        workTaskTypeCode,
        workTaskStatusCode,
        taskName,
        instruction,
        dueType,
        attachmentUri,
        startedDate,
        cancelledDate,
        dueDate,
        createdDate,
        createdUserId,
        modifiedDate,
        modifiedUserId,
        isCompleted,
        isDeleted,
        isStarted,
        isCancelled
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<WorkTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_task_id')) {
      context.handle(
          _workTaskIdMeta,
          workTaskId.isAcceptableOrUnknown(
              data['work_task_id']!, _workTaskIdMeta));
    }
    if (data.containsKey('farm_field_id')) {
      context.handle(
          _farmFieldIdMeta,
          farmFieldId.isAcceptableOrUnknown(
              data['farm_field_id']!, _farmFieldIdMeta));
    } else if (isInserting) {
      context.missing(_farmFieldIdMeta);
    }
    if (data.containsKey('work_task_type_code')) {
      context.handle(
          _workTaskTypeCodeMeta,
          workTaskTypeCode.isAcceptableOrUnknown(
              data['work_task_type_code']!, _workTaskTypeCodeMeta));
    } else if (isInserting) {
      context.missing(_workTaskTypeCodeMeta);
    }
    if (data.containsKey('work_task_status_code')) {
      context.handle(
          _workTaskStatusCodeMeta,
          workTaskStatusCode.isAcceptableOrUnknown(
              data['work_task_status_code']!, _workTaskStatusCodeMeta));
    }
    if (data.containsKey('task_name')) {
      context.handle(_taskNameMeta,
          taskName.isAcceptableOrUnknown(data['task_name']!, _taskNameMeta));
    }
    if (data.containsKey('instruction')) {
      context.handle(
          _instructionMeta,
          instruction.isAcceptableOrUnknown(
              data['instruction']!, _instructionMeta));
    }
    if (data.containsKey('due_type')) {
      context.handle(_dueTypeMeta,
          dueType.isAcceptableOrUnknown(data['due_type']!, _dueTypeMeta));
    }
    if (data.containsKey('attachment_uri')) {
      context.handle(
          _attachmentUriMeta,
          attachmentUri.isAcceptableOrUnknown(
              data['attachment_uri']!, _attachmentUriMeta));
    }
    if (data.containsKey('started_date')) {
      context.handle(
          _startedDateMeta,
          startedDate.isAcceptableOrUnknown(
              data['started_date']!, _startedDateMeta));
    }
    if (data.containsKey('cancelled_date')) {
      context.handle(
          _cancelledDateMeta,
          cancelledDate.isAcceptableOrUnknown(
              data['cancelled_date']!, _cancelledDateMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('created_user_id')) {
      context.handle(
          _createdUserIdMeta,
          createdUserId.isAcceptableOrUnknown(
              data['created_user_id']!, _createdUserIdMeta));
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    }
    if (data.containsKey('modified_user_id')) {
      context.handle(
          _modifiedUserIdMeta,
          modifiedUserId.isAcceptableOrUnknown(
              data['modified_user_id']!, _modifiedUserIdMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('is_started')) {
      context.handle(_isStartedMeta,
          isStarted.isAcceptableOrUnknown(data['is_started']!, _isStartedMeta));
    }
    if (data.containsKey('is_cancelled')) {
      context.handle(
          _isCancelledMeta,
          isCancelled.isAcceptableOrUnknown(
              data['is_cancelled']!, _isCancelledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workTaskId};
  @override
  WorkTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkTask(
      workTaskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_task_id'])!,
      farmFieldId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}farm_field_id'])!,
      workTaskTypeCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}work_task_type_code'])!,
      workTaskStatusCode: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}work_task_status_code'])!,
      taskName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_name']),
      instruction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instruction']),
      dueType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}due_type']),
      attachmentUri: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment_uri']),
      startedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_date']),
      cancelledDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cancelled_date']),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
      createdUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_user_id']),
      modifiedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_date']),
      modifiedUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}modified_user_id']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      isStarted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_started'])!,
      isCancelled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_cancelled'])!,
    );
  }

  @override
  $WorkTasksTable createAlias(String alias) {
    return $WorkTasksTable(attachedDatabase, alias);
  }
}

class WorkTask extends DataClass implements Insertable<WorkTask> {
  final int workTaskId;
  final int farmFieldId;
  final String workTaskTypeCode;
  final String workTaskStatusCode;
  final DateTime? startedDate;
  final DateTime? cancelledDate;
  final DateTime? dueDate;
  final DateTime? createdDate;
  final int? createdUserId;
  final DateTime? modifiedDate;
  final int? modifiedUserId;
  final bool isCompleted;
  final bool isDeleted;
  final bool isStarted;
  final bool isCancelled;
  final String? taskName;
  final String? instruction;
  final String? dueType;
  final String? attachmentUri;
  const WorkTask(
      {required this.workTaskId,
      required this.farmFieldId,
      required this.workTaskTypeCode,
      required this.workTaskStatusCode,
      this.startedDate,
      this.cancelledDate,
      this.dueDate,
      this.createdDate,
      this.createdUserId,
      this.modifiedDate,
      this.modifiedUserId,
      required this.isCompleted,
      required this.isDeleted,
      required this.isStarted,
      required this.isCancelled,
      this.taskName,
      this.instruction,
      this.dueType,
      this.attachmentUri});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_task_id'] = Variable<int>(workTaskId);
    map['farm_field_id'] = Variable<int>(farmFieldId);
    map['work_task_type_code'] = Variable<String>(workTaskTypeCode);
    map['work_task_status_code'] = Variable<String>(workTaskStatusCode);
    if (!nullToAbsent || startedDate != null) {
      map['started_date'] = Variable<DateTime>(startedDate);
    }
    if (!nullToAbsent || cancelledDate != null) {
      map['cancelled_date'] = Variable<DateTime>(cancelledDate);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || createdUserId != null) {
      map['created_user_id'] = Variable<int>(createdUserId);
    }
    if (!nullToAbsent || modifiedDate != null) {
      map['modified_date'] = Variable<DateTime>(modifiedDate);
    }
    if (!nullToAbsent || modifiedUserId != null) {
      map['modified_user_id'] = Variable<int>(modifiedUserId);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['is_started'] = Variable<bool>(isStarted);
    map['is_cancelled'] = Variable<bool>(isCancelled);
    if (!nullToAbsent || taskName != null) {
      map['task_name'] = Variable<String>(taskName);
    }
    if (!nullToAbsent || instruction != null) {
      map['instruction'] = Variable<String>(instruction);
    }
    if (!nullToAbsent || dueType != null) {
      map['due_type'] = Variable<String>(dueType);
    }
    if (!nullToAbsent || attachmentUri != null) {
      map['attachment_uri'] = Variable<String>(attachmentUri);
    }
    return map;
  }

  WorkTasksCompanion toCompanion(bool nullToAbsent) {
    return WorkTasksCompanion(
      workTaskId: Value(workTaskId),
      farmFieldId: Value(farmFieldId),
      workTaskTypeCode: Value(workTaskTypeCode),
      workTaskStatusCode: Value(workTaskStatusCode),
      startedDate: startedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startedDate),
      cancelledDate: cancelledDate == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelledDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdUserId: createdUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdUserId),
      modifiedDate: modifiedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedDate),
      modifiedUserId: modifiedUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedUserId),
      isCompleted: Value(isCompleted),
      isDeleted: Value(isDeleted),
      isStarted: Value(isStarted),
      isCancelled: Value(isCancelled),
      taskName: taskName == null && nullToAbsent
          ? const Value.absent()
          : Value(taskName),
      instruction: instruction == null && nullToAbsent
          ? const Value.absent()
          : Value(instruction),
      dueType: dueType == null && nullToAbsent
          ? const Value.absent()
          : Value(dueType),
      attachmentUri: attachmentUri == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentUri),
    );
  }

  factory WorkTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkTask(
      workTaskId: serializer.fromJson<int>(json['workTaskId']),
      farmFieldId: serializer.fromJson<int>(json['farmFieldId']),
      workTaskTypeCode: serializer.fromJson<String>(json['workTaskTypeCode']),
      workTaskStatusCode:
          serializer.fromJson<String>(json['workTaskStatusCode']),
      startedDate: serializer.fromJson<DateTime?>(json['startedDate']),
      cancelledDate: serializer.fromJson<DateTime?>(json['cancelledDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
      createdUserId: serializer.fromJson<int?>(json['createdUserId']),
      modifiedDate: serializer.fromJson<DateTime?>(json['modifiedDate']),
      modifiedUserId: serializer.fromJson<int?>(json['modifiedUserId']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      isStarted: serializer.fromJson<bool>(json['isStarted']),
      isCancelled: serializer.fromJson<bool>(json['isCancelled']),
      taskName: serializer.fromJson<String?>(json['taskName']),
      instruction: serializer.fromJson<String?>(json['instruction']),
      dueType: serializer.fromJson<String?>(json['dueType']),
      attachmentUri: serializer.fromJson<String?>(json['attachmentUri']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workTaskId': serializer.toJson<int>(workTaskId),
      'farmFieldId': serializer.toJson<int>(farmFieldId),
      'workTaskTypeCode': serializer.toJson<String>(workTaskTypeCode),
      'workTaskStatusCode': serializer.toJson<String>(workTaskStatusCode),
      'startedDate': serializer.toJson<DateTime?>(startedDate),
      'cancelledDate': serializer.toJson<DateTime?>(cancelledDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
      'createdUserId': serializer.toJson<int?>(createdUserId),
      'modifiedDate': serializer.toJson<DateTime?>(modifiedDate),
      'modifiedUserId': serializer.toJson<int?>(modifiedUserId),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'isStarted': serializer.toJson<bool>(isStarted),
      'isCancelled': serializer.toJson<bool>(isCancelled),
      'taskName': serializer.toJson<String?>(taskName),
      'instruction': serializer.toJson<String?>(instruction),
      'dueType': serializer.toJson<String?>(dueType),
      'attachmentUri': serializer.toJson<String?>(attachmentUri),
    };
  }

  WorkTask copyWith(
          {int? workTaskId,
          int? farmFieldId,
          String? workTaskTypeCode,
          String? workTaskStatusCode,
          Value<DateTime?> startedDate = const Value.absent(),
          Value<DateTime?> cancelledDate = const Value.absent(),
          Value<DateTime?> dueDate = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent(),
          Value<int?> createdUserId = const Value.absent(),
          Value<DateTime?> modifiedDate = const Value.absent(),
          Value<int?> modifiedUserId = const Value.absent(),
          bool? isCompleted,
          bool? isDeleted,
          bool? isStarted,
          bool? isCancelled}) =>
      WorkTask(
        workTaskId: workTaskId ?? this.workTaskId,
        farmFieldId: farmFieldId ?? this.farmFieldId,
        workTaskTypeCode: workTaskTypeCode ?? this.workTaskTypeCode,
        workTaskStatusCode: workTaskStatusCode ?? this.workTaskStatusCode,
        startedDate: startedDate.present ? startedDate.value : this.startedDate,
        cancelledDate:
            cancelledDate.present ? cancelledDate.value : this.cancelledDate,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
        createdUserId:
            createdUserId.present ? createdUserId.value : this.createdUserId,
        modifiedDate:
            modifiedDate.present ? modifiedDate.value : this.modifiedDate,
        modifiedUserId:
            modifiedUserId.present ? modifiedUserId.value : this.modifiedUserId,
        isCompleted: isCompleted ?? this.isCompleted,
        isDeleted: isDeleted ?? this.isDeleted,
        isStarted: isStarted ?? this.isStarted,
        isCancelled: isCancelled ?? this.isCancelled,
        taskName: taskName ?? this.taskName,
        instruction: instruction ?? this.instruction,
        dueType: dueType ?? this.dueType,
        attachmentUri: attachmentUri ?? this.attachmentUri,
      );
  WorkTask copyWithCompanion(WorkTasksCompanion data) {
    return WorkTask(
      workTaskId:
          data.workTaskId.present ? data.workTaskId.value : this.workTaskId,
      farmFieldId:
          data.farmFieldId.present ? data.farmFieldId.value : this.farmFieldId,
      workTaskTypeCode: data.workTaskTypeCode.present
          ? data.workTaskTypeCode.value
          : this.workTaskTypeCode,
      workTaskStatusCode: data.workTaskStatusCode.present
          ? data.workTaskStatusCode.value
          : this.workTaskStatusCode,
      startedDate:
          data.startedDate.present ? data.startedDate.value : this.startedDate,
      cancelledDate: data.cancelledDate.present
          ? data.cancelledDate.value
          : this.cancelledDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      createdUserId: data.createdUserId.present
          ? data.createdUserId.value
          : this.createdUserId,
      modifiedDate: data.modifiedDate.present
          ? data.modifiedDate.value
          : this.modifiedDate,
      modifiedUserId: data.modifiedUserId.present
          ? data.modifiedUserId.value
          : this.modifiedUserId,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      isStarted: data.isStarted.present ? data.isStarted.value : this.isStarted,
      isCancelled:
          data.isCancelled.present ? data.isCancelled.value : this.isCancelled,
      taskName: data.taskName.present ? data.taskName.value : this.taskName,
      instruction:
          data.instruction.present ? data.instruction.value : this.instruction,
      dueType: data.dueType.present ? data.dueType.value : this.dueType,
      attachmentUri: data.attachmentUri.present
          ? data.attachmentUri.value
          : this.attachmentUri,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkTask(')
          ..write('workTaskId: $workTaskId, ')
          ..write('farmFieldId: $farmFieldId, ')
          ..write('workTaskTypeCode: $workTaskTypeCode, ')
          ..write('workTaskStatusCode: $workTaskStatusCode, ')
          ..write('startedDate: $startedDate, ')
          ..write('cancelledDate: $cancelledDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isStarted: $isStarted, ')
          ..write('isCancelled: $isCancelled, ')
          ..write('taskName: $taskName, ')
          ..write('instruction: $instruction, ')
          ..write('dueType: $dueType, ')
          ..write('attachmentUri: $attachmentUri')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      workTaskId,
      farmFieldId,
      workTaskTypeCode,
      workTaskStatusCode,
      startedDate,
      cancelledDate,
      dueDate,
      createdDate,
      createdUserId,
      modifiedDate,
      modifiedUserId,
      isCompleted,
      isDeleted,
      isStarted,
      isCancelled,
      taskName,
      instruction,
      dueType,
      attachmentUri);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkTask &&
          other.workTaskId == this.workTaskId &&
          other.farmFieldId == this.farmFieldId &&
          other.workTaskTypeCode == this.workTaskTypeCode &&
          other.workTaskStatusCode == this.workTaskStatusCode &&
          other.startedDate == this.startedDate &&
          other.cancelledDate == this.cancelledDate &&
          other.dueDate == this.dueDate &&
          other.createdDate == this.createdDate &&
          other.createdUserId == this.createdUserId &&
          other.modifiedDate == this.modifiedDate &&
          other.modifiedUserId == this.modifiedUserId &&
          other.isCompleted == this.isCompleted &&
          other.isDeleted == this.isDeleted &&
          other.isStarted == this.isStarted &&
          other.isCancelled == this.isCancelled &&
          other.taskName == this.taskName &&
          other.instruction == this.instruction &&
          other.dueType == this.dueType &&
          other.attachmentUri == this.attachmentUri);
}

class WorkTasksCompanion extends UpdateCompanion<WorkTask> {
  final Value<int> workTaskId;
  final Value<int> farmFieldId;
  final Value<String> workTaskTypeCode;
  final Value<String> workTaskStatusCode;
  final Value<DateTime?> startedDate;
  final Value<DateTime?> cancelledDate;
  final Value<DateTime?> dueDate;
  final Value<DateTime?> createdDate;
  final Value<int?> createdUserId;
  final Value<DateTime?> modifiedDate;
  final Value<int?> modifiedUserId;
  final Value<bool> isCompleted;
  final Value<bool> isDeleted;
  final Value<bool> isStarted;
  final Value<bool> isCancelled;
  final Value<String?> taskName;
  final Value<String?> instruction;
  final Value<String?> dueType;
  final Value<String?> attachmentUri;
  const WorkTasksCompanion({
    this.workTaskId = const Value.absent(),
    this.farmFieldId = const Value.absent(),
    this.workTaskTypeCode = const Value.absent(),
    this.workTaskStatusCode = const Value.absent(),
    this.startedDate = const Value.absent(),
    this.cancelledDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isStarted = const Value.absent(),
    this.isCancelled = const Value.absent(),
    this.taskName = const Value.absent(),
    this.instruction = const Value.absent(),
    this.dueType = const Value.absent(),
    this.attachmentUri = const Value.absent(),
  });
  WorkTasksCompanion.insert({
    this.workTaskId = const Value.absent(),
    required int farmFieldId,
    required String workTaskTypeCode,
    this.workTaskStatusCode = const Value.absent(),
    this.startedDate = const Value.absent(),
    this.cancelledDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdUserId = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.modifiedUserId = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isStarted = const Value.absent(),
    this.isCancelled = const Value.absent(),
    this.taskName = const Value.absent(),
    this.instruction = const Value.absent(),
    this.dueType = const Value.absent(),
    this.attachmentUri = const Value.absent(),
  })  : farmFieldId = Value(farmFieldId),
        workTaskTypeCode = Value(workTaskTypeCode);
  static Insertable<WorkTask> custom({
    Expression<int>? workTaskId,
    Expression<int>? farmFieldId,
    Expression<String>? workTaskTypeCode,
    Expression<String>? workTaskStatusCode,
    Expression<DateTime>? startedDate,
    Expression<DateTime>? cancelledDate,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? createdDate,
    Expression<int>? createdUserId,
    Expression<DateTime>? modifiedDate,
    Expression<int>? modifiedUserId,
    Expression<bool>? isCompleted,
    Expression<bool>? isDeleted,
    Expression<bool>? isStarted,
    Expression<bool>? isCancelled,
  }) {
    return RawValuesInsertable({
      if (workTaskId != null) 'work_task_id': workTaskId,
      if (farmFieldId != null) 'farm_field_id': farmFieldId,
      if (workTaskTypeCode != null) 'work_task_type_code': workTaskTypeCode,
      if (workTaskStatusCode != null)
        'work_task_status_code': workTaskStatusCode,
      if (startedDate != null) 'started_date': startedDate,
      if (cancelledDate != null) 'cancelled_date': cancelledDate,
      if (dueDate != null) 'due_date': dueDate,
      if (createdDate != null) 'created_date': createdDate,
      if (createdUserId != null) 'created_user_id': createdUserId,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (modifiedUserId != null) 'modified_user_id': modifiedUserId,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (isStarted != null) 'is_started': isStarted,
      if (isCancelled != null) 'is_cancelled': isCancelled,
    });
  }

  WorkTasksCompanion copyWith(
      {Value<int>? workTaskId,
      Value<int>? farmFieldId,
      Value<String>? workTaskTypeCode,
      Value<String>? workTaskStatusCode,
      Value<DateTime?>? startedDate,
      Value<DateTime?>? cancelledDate,
      Value<DateTime?>? dueDate,
      Value<DateTime?>? createdDate,
      Value<int?>? createdUserId,
      Value<DateTime?>? modifiedDate,
      Value<int?>? modifiedUserId,
      Value<bool>? isCompleted,
      Value<bool>? isDeleted,
      Value<bool>? isStarted,
      Value<bool>? isCancelled,
      Value<String?>? taskName,
      Value<String?>? instruction,
      Value<String?>? dueType,
      Value<String?>? attachmentUri}) {
    return WorkTasksCompanion(
      workTaskId: workTaskId ?? this.workTaskId,
      farmFieldId: farmFieldId ?? this.farmFieldId,
      workTaskTypeCode: workTaskTypeCode ?? this.workTaskTypeCode,
      workTaskStatusCode: workTaskStatusCode ?? this.workTaskStatusCode,
      startedDate: startedDate ?? this.startedDate,
      cancelledDate: cancelledDate ?? this.cancelledDate,
      dueDate: dueDate ?? this.dueDate,
      createdDate: createdDate ?? this.createdDate,
      createdUserId: createdUserId ?? this.createdUserId,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedUserId: modifiedUserId ?? this.modifiedUserId,
      isCompleted: isCompleted ?? this.isCompleted,
      isDeleted: isDeleted ?? this.isDeleted,
      isStarted: isStarted ?? this.isStarted,
      isCancelled: isCancelled ?? this.isCancelled,
      taskName: taskName ?? this.taskName,
      instruction: instruction ?? this.instruction,
      dueType: dueType ?? this.dueType,
      attachmentUri: attachmentUri ?? this.attachmentUri,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workTaskId.present) {
      map['work_task_id'] = Variable<int>(workTaskId.value);
    }
    if (farmFieldId.present) {
      map['farm_field_id'] = Variable<int>(farmFieldId.value);
    }
    if (workTaskTypeCode.present) {
      map['work_task_type_code'] = Variable<String>(workTaskTypeCode.value);
    }
    if (workTaskStatusCode.present) {
      map['work_task_status_code'] = Variable<String>(workTaskStatusCode.value);
    }
    if (startedDate.present) {
      map['started_date'] = Variable<DateTime>(startedDate.value);
    }
    if (cancelledDate.present) {
      map['cancelled_date'] = Variable<DateTime>(cancelledDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (createdUserId.present) {
      map['created_user_id'] = Variable<int>(createdUserId.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (modifiedUserId.present) {
      map['modified_user_id'] = Variable<int>(modifiedUserId.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (isStarted.present) {
      map['is_started'] = Variable<bool>(isStarted.value);
    }
    if (isCancelled.present) {
      map['is_cancelled'] = Variable<bool>(isCancelled.value);
    }
    if (taskName.present) {
      map['task_name'] = Variable<String>(taskName.value);
    }
    if (instruction.present) {
      map['instruction'] = Variable<String>(instruction.value);
    }
    if (dueType.present) {
      map['due_type'] = Variable<String>(dueType.value);
    }
    if (attachmentUri.present) {
      map['attachment_uri'] = Variable<String>(attachmentUri.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkTasksCompanion(')
          ..write('workTaskId: $workTaskId, ')
          ..write('farmFieldId: $farmFieldId, ')
          ..write('workTaskTypeCode: $workTaskTypeCode, ')
          ..write('workTaskStatusCode: $workTaskStatusCode, ')
          ..write('startedDate: $startedDate, ')
          ..write('cancelledDate: $cancelledDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdUserId: $createdUserId, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('modifiedUserId: $modifiedUserId, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isStarted: $isStarted, ')
          ..write('isCancelled: $isCancelled, ')
          ..write('taskName: $taskName, ')
          ..write('instruction: $instruction, ')
          ..write('dueType: $dueType, ')
          ..write('attachmentUri: $attachmentUri')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $CropsTable crops = $CropsTable(this);
  late final $FarmSitesTable farmSites = $FarmSitesTable(this);
  late final $FarmFieldsTable farmFields = $FarmFieldsTable(this);
  late final $WorkTaskTypesTable workTaskTypes = $WorkTaskTypesTable(this);
  late final $WorkTasksTable workTasks = $WorkTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, crops, farmSites, farmFields, workTaskTypes, workTasks];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> userId,
  Value<bool> isCustomerUser,
  required String username,
  required String userPassword,
  Value<String?> userGivenName,
  Value<String?> userEmailAddress,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<String> userStatus,
  Value<bool> isDeleted,
  Value<int?> farmSiteId,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> userId,
  Value<bool> isCustomerUser,
  Value<String> username,
  Value<String> userPassword,
  Value<String?> userGivenName,
  Value<String?> userEmailAddress,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<String> userStatus,
  Value<bool> isDeleted,
  Value<int?> farmSiteId,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCustomerUser => $composableBuilder(
      column: $table.isCustomerUser,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userPassword => $composableBuilder(
      column: $table.userPassword, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userGivenName => $composableBuilder(
      column: $table.userGivenName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userEmailAddress => $composableBuilder(
      column: $table.userEmailAddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdUserId => $composableBuilder(
      column: $table.createdUserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get modifiedUserId => $composableBuilder(
      column: $table.modifiedUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userStatus => $composableBuilder(
      column: $table.userStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get farmSiteId => $composableBuilder(
      column: $table.farmSiteId, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCustomerUser => $composableBuilder(
      column: $table.isCustomerUser,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userPassword => $composableBuilder(
      column: $table.userPassword,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userGivenName => $composableBuilder(
      column: $table.userGivenName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userEmailAddress => $composableBuilder(
      column: $table.userEmailAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdUserId => $composableBuilder(
      column: $table.createdUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get modifiedUserId => $composableBuilder(
      column: $table.modifiedUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userStatus => $composableBuilder(
      column: $table.userStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get farmSiteId => $composableBuilder(
      column: $table.farmSiteId, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get isCustomerUser => $composableBuilder(
      column: $table.isCustomerUser, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get userPassword => $composableBuilder(
      column: $table.userPassword, builder: (column) => column);

  GeneratedColumn<String> get userGivenName => $composableBuilder(
      column: $table.userGivenName, builder: (column) => column);

  GeneratedColumn<String> get userEmailAddress => $composableBuilder(
      column: $table.userEmailAddress, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<int> get createdUserId => $composableBuilder(
      column: $table.createdUserId, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<int> get modifiedUserId => $composableBuilder(
      column: $table.modifiedUserId, builder: (column) => column);

  GeneratedColumn<String> get userStatus => $composableBuilder(
      column: $table.userStatus, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get farmSiteId => $composableBuilder(
      column: $table.farmSiteId, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<bool> isCustomerUser = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> userPassword = const Value.absent(),
            Value<String?> userGivenName = const Value.absent(),
            Value<String?> userEmailAddress = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<String> userStatus = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int?> farmSiteId = const Value.absent(),
          }) =>
              UsersCompanion(
            userId: userId,
            isCustomerUser: isCustomerUser,
            username: username,
            userPassword: userPassword,
            userGivenName: userGivenName,
            userEmailAddress: userEmailAddress,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            userStatus: userStatus,
            isDeleted: isDeleted,
            farmSiteId: farmSiteId,
          ),
          createCompanionCallback: ({
            Value<int> userId = const Value.absent(),
            Value<bool> isCustomerUser = const Value.absent(),
            required String username,
            required String userPassword,
            Value<String?> userGivenName = const Value.absent(),
            Value<String?> userEmailAddress = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<String> userStatus = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int?> farmSiteId = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            userId: userId,
            isCustomerUser: isCustomerUser,
            username: username,
            userPassword: userPassword,
            userGivenName: userGivenName,
            userEmailAddress: userEmailAddress,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            userStatus: userStatus,
            isDeleted: isDeleted,
            farmSiteId: farmSiteId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$CropsTableCreateCompanionBuilder = CropsCompanion Function({
  Value<int> cropId,
  required String cropCode,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isDeleted,
});
typedef $$CropsTableUpdateCompanionBuilder = CropsCompanion Function({
  Value<int> cropId,
  Value<String> cropCode,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isDeleted,
});

final class $$CropsTableReferences
    extends BaseReferences<_$AppDatabase, $CropsTable, Crop> {
  $$CropsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _createdUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.crops.createdUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get createdUserId {
    final $_column = $_itemColumn<int>('created_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _modifiedUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.crops.modifiedUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get modifiedUserId {
    final $_column = $_itemColumn<int>('modified_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modifiedUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$FarmSitesTable, List<FarmSite>>
      _farmSitesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.farmSites,
              aliasName: $_aliasNameGenerator(
                  db.crops.cropId, db.farmSites.defaultPrimaryCropId));

  $$FarmSitesTableProcessedTableManager get farmSitesRefs {
    final manager = $$FarmSitesTableTableManager($_db, $_db.farmSites).filter(
        (f) => f.defaultPrimaryCropId.cropId
            .sqlEquals($_itemColumn<int>('crop_id')!));

    final cache = $_typedResult.readTableOrNull(_farmSitesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CropsTableFilterComposer extends Composer<_$AppDatabase, $CropsTable> {
  $$CropsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cropId => $composableBuilder(
      column: $table.cropId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cropCode => $composableBuilder(
      column: $table.cropCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get createdUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get modifiedUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> farmSitesRefs(
      Expression<bool> Function($$FarmSitesTableFilterComposer f) f) {
    final $$FarmSitesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cropId,
        referencedTable: $db.farmSites,
        getReferencedColumn: (t) => t.defaultPrimaryCropId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmSitesTableFilterComposer(
              $db: $db,
              $table: $db.farmSites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CropsTableOrderingComposer
    extends Composer<_$AppDatabase, $CropsTable> {
  $$CropsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cropId => $composableBuilder(
      column: $table.cropId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cropCode => $composableBuilder(
      column: $table.cropCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get createdUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get modifiedUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CropsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CropsTable> {
  $$CropsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cropId =>
      $composableBuilder(column: $table.cropId, builder: (column) => column);

  GeneratedColumn<String> get cropCode =>
      $composableBuilder(column: $table.cropCode, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get createdUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get modifiedUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> farmSitesRefs<T extends Object>(
      Expression<T> Function($$FarmSitesTableAnnotationComposer a) f) {
    final $$FarmSitesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cropId,
        referencedTable: $db.farmSites,
        getReferencedColumn: (t) => t.defaultPrimaryCropId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmSitesTableAnnotationComposer(
              $db: $db,
              $table: $db.farmSites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CropsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CropsTable,
    Crop,
    $$CropsTableFilterComposer,
    $$CropsTableOrderingComposer,
    $$CropsTableAnnotationComposer,
    $$CropsTableCreateCompanionBuilder,
    $$CropsTableUpdateCompanionBuilder,
    (Crop, $$CropsTableReferences),
    Crop,
    PrefetchHooks Function(
        {bool createdUserId, bool modifiedUserId, bool farmSitesRefs})> {
  $$CropsTableTableManager(_$AppDatabase db, $CropsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CropsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CropsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CropsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> cropId = const Value.absent(),
            Value<String> cropCode = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CropsCompanion(
            cropId: cropId,
            cropCode: cropCode,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> cropId = const Value.absent(),
            required String cropCode,
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CropsCompanion.insert(
            cropId: cropId,
            cropCode: cropCode,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CropsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {createdUserId = false,
              modifiedUserId = false,
              farmSitesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (farmSitesRefs) db.farmSites],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (createdUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdUserId,
                    referencedTable:
                        $$CropsTableReferences._createdUserIdTable(db),
                    referencedColumn:
                        $$CropsTableReferences._createdUserIdTable(db).userId,
                  ) as T;
                }
                if (modifiedUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modifiedUserId,
                    referencedTable:
                        $$CropsTableReferences._modifiedUserIdTable(db),
                    referencedColumn:
                        $$CropsTableReferences._modifiedUserIdTable(db).userId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (farmSitesRefs)
                    await $_getPrefetchedData<Crop, $CropsTable, FarmSite>(
                        currentTable: table,
                        referencedTable:
                            $$CropsTableReferences._farmSitesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CropsTableReferences(db, table, p0).farmSitesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.defaultPrimaryCropId == item.cropId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CropsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CropsTable,
    Crop,
    $$CropsTableFilterComposer,
    $$CropsTableOrderingComposer,
    $$CropsTableAnnotationComposer,
    $$CropsTableCreateCompanionBuilder,
    $$CropsTableUpdateCompanionBuilder,
    (Crop, $$CropsTableReferences),
    Crop,
    PrefetchHooks Function(
        {bool createdUserId, bool modifiedUserId, bool farmSitesRefs})>;
typedef $$FarmSitesTableCreateCompanionBuilder = FarmSitesCompanion Function({
  Value<int> farmSiteId,
  required String farmSiteName,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<int?> defaultPrimaryCropId,
  Value<bool> isDeleted,
});
typedef $$FarmSitesTableUpdateCompanionBuilder = FarmSitesCompanion Function({
  Value<int> farmSiteId,
  Value<String> farmSiteName,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<int?> defaultPrimaryCropId,
  Value<bool> isDeleted,
});

final class $$FarmSitesTableReferences
    extends BaseReferences<_$AppDatabase, $FarmSitesTable, FarmSite> {
  $$FarmSitesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _createdUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.farmSites.createdUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get createdUserId {
    final $_column = $_itemColumn<int>('created_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _modifiedUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.farmSites.modifiedUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get modifiedUserId {
    final $_column = $_itemColumn<int>('modified_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modifiedUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CropsTable _defaultPrimaryCropIdTable(_$AppDatabase db) =>
      db.crops.createAlias($_aliasNameGenerator(
          db.farmSites.defaultPrimaryCropId, db.crops.cropId));

  $$CropsTableProcessedTableManager? get defaultPrimaryCropId {
    final $_column = $_itemColumn<int>('default_primary_crop_id');
    if ($_column == null) return null;
    final manager = $$CropsTableTableManager($_db, $_db.crops)
        .filter((f) => f.cropId.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_defaultPrimaryCropIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$FarmFieldsTable, List<FarmField>>
      _farmFieldsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.farmFields,
              aliasName: $_aliasNameGenerator(
                  db.farmSites.farmSiteId, db.farmFields.farmSiteId));

  $$FarmFieldsTableProcessedTableManager get farmFieldsRefs {
    final manager = $$FarmFieldsTableTableManager($_db, $_db.farmFields).filter(
        (f) => f.farmSiteId.farmSiteId
            .sqlEquals($_itemColumn<int>('farm_site_id')!));

    final cache = $_typedResult.readTableOrNull(_farmFieldsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FarmSitesTableFilterComposer
    extends Composer<_$AppDatabase, $FarmSitesTable> {
  $$FarmSitesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get farmSiteId => $composableBuilder(
      column: $table.farmSiteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmSiteName => $composableBuilder(
      column: $table.farmSiteName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get createdUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get modifiedUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CropsTableFilterComposer get defaultPrimaryCropId {
    final $$CropsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defaultPrimaryCropId,
        referencedTable: $db.crops,
        getReferencedColumn: (t) => t.cropId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CropsTableFilterComposer(
              $db: $db,
              $table: $db.crops,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> farmFieldsRefs(
      Expression<bool> Function($$FarmFieldsTableFilterComposer f) f) {
    final $$FarmFieldsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmSiteId,
        referencedTable: $db.farmFields,
        getReferencedColumn: (t) => t.farmSiteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmFieldsTableFilterComposer(
              $db: $db,
              $table: $db.farmFields,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FarmSitesTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmSitesTable> {
  $$FarmSitesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get farmSiteId => $composableBuilder(
      column: $table.farmSiteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmSiteName => $composableBuilder(
      column: $table.farmSiteName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get createdUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get modifiedUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CropsTableOrderingComposer get defaultPrimaryCropId {
    final $$CropsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defaultPrimaryCropId,
        referencedTable: $db.crops,
        getReferencedColumn: (t) => t.cropId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CropsTableOrderingComposer(
              $db: $db,
              $table: $db.crops,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FarmSitesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmSitesTable> {
  $$FarmSitesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get farmSiteId => $composableBuilder(
      column: $table.farmSiteId, builder: (column) => column);

  GeneratedColumn<String> get farmSiteName => $composableBuilder(
      column: $table.farmSiteName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get createdUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get modifiedUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CropsTableAnnotationComposer get defaultPrimaryCropId {
    final $$CropsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defaultPrimaryCropId,
        referencedTable: $db.crops,
        getReferencedColumn: (t) => t.cropId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CropsTableAnnotationComposer(
              $db: $db,
              $table: $db.crops,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> farmFieldsRefs<T extends Object>(
      Expression<T> Function($$FarmFieldsTableAnnotationComposer a) f) {
    final $$FarmFieldsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmSiteId,
        referencedTable: $db.farmFields,
        getReferencedColumn: (t) => t.farmSiteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmFieldsTableAnnotationComposer(
              $db: $db,
              $table: $db.farmFields,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FarmSitesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FarmSitesTable,
    FarmSite,
    $$FarmSitesTableFilterComposer,
    $$FarmSitesTableOrderingComposer,
    $$FarmSitesTableAnnotationComposer,
    $$FarmSitesTableCreateCompanionBuilder,
    $$FarmSitesTableUpdateCompanionBuilder,
    (FarmSite, $$FarmSitesTableReferences),
    FarmSite,
    PrefetchHooks Function(
        {bool createdUserId,
        bool modifiedUserId,
        bool defaultPrimaryCropId,
        bool farmFieldsRefs})> {
  $$FarmSitesTableTableManager(_$AppDatabase db, $FarmSitesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmSitesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmSitesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmSitesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> farmSiteId = const Value.absent(),
            Value<String> farmSiteName = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<int?> defaultPrimaryCropId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              FarmSitesCompanion(
            farmSiteId: farmSiteId,
            farmSiteName: farmSiteName,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            defaultPrimaryCropId: defaultPrimaryCropId,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> farmSiteId = const Value.absent(),
            required String farmSiteName,
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<int?> defaultPrimaryCropId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              FarmSitesCompanion.insert(
            farmSiteId: farmSiteId,
            farmSiteName: farmSiteName,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            defaultPrimaryCropId: defaultPrimaryCropId,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FarmSitesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {createdUserId = false,
              modifiedUserId = false,
              defaultPrimaryCropId = false,
              farmFieldsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (farmFieldsRefs) db.farmFields],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (createdUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdUserId,
                    referencedTable:
                        $$FarmSitesTableReferences._createdUserIdTable(db),
                    referencedColumn: $$FarmSitesTableReferences
                        ._createdUserIdTable(db)
                        .userId,
                  ) as T;
                }
                if (modifiedUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modifiedUserId,
                    referencedTable:
                        $$FarmSitesTableReferences._modifiedUserIdTable(db),
                    referencedColumn: $$FarmSitesTableReferences
                        ._modifiedUserIdTable(db)
                        .userId,
                  ) as T;
                }
                if (defaultPrimaryCropId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.defaultPrimaryCropId,
                    referencedTable: $$FarmSitesTableReferences
                        ._defaultPrimaryCropIdTable(db),
                    referencedColumn: $$FarmSitesTableReferences
                        ._defaultPrimaryCropIdTable(db)
                        .cropId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (farmFieldsRefs)
                    await $_getPrefetchedData<FarmSite, $FarmSitesTable,
                            FarmField>(
                        currentTable: table,
                        referencedTable:
                            $$FarmSitesTableReferences._farmFieldsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FarmSitesTableReferences(db, table, p0)
                                .farmFieldsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.farmSiteId == item.farmSiteId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FarmSitesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FarmSitesTable,
    FarmSite,
    $$FarmSitesTableFilterComposer,
    $$FarmSitesTableOrderingComposer,
    $$FarmSitesTableAnnotationComposer,
    $$FarmSitesTableCreateCompanionBuilder,
    $$FarmSitesTableUpdateCompanionBuilder,
    (FarmSite, $$FarmSitesTableReferences),
    FarmSite,
    PrefetchHooks Function(
        {bool createdUserId,
        bool modifiedUserId,
        bool defaultPrimaryCropId,
        bool farmFieldsRefs})>;
typedef $$FarmFieldsTableCreateCompanionBuilder = FarmFieldsCompanion Function({
  Value<int> farmFieldId,
  required int farmSiteId,
  required String farmFieldName,
  Value<String?> farmFieldCode,
  Value<double?> rowWidth,
  Value<String?> farmFieldRowDirection,
  Value<String?> farmFieldColorHexCode,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isDeleted,
});
typedef $$FarmFieldsTableUpdateCompanionBuilder = FarmFieldsCompanion Function({
  Value<int> farmFieldId,
  Value<int> farmSiteId,
  Value<String> farmFieldName,
  Value<String?> farmFieldCode,
  Value<double?> rowWidth,
  Value<String?> farmFieldRowDirection,
  Value<String?> farmFieldColorHexCode,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isDeleted,
});

final class $$FarmFieldsTableReferences
    extends BaseReferences<_$AppDatabase, $FarmFieldsTable, FarmField> {
  $$FarmFieldsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FarmSitesTable _farmSiteIdTable(_$AppDatabase db) =>
      db.farmSites.createAlias($_aliasNameGenerator(
          db.farmFields.farmSiteId, db.farmSites.farmSiteId));

  $$FarmSitesTableProcessedTableManager get farmSiteId {
    final $_column = $_itemColumn<int>('farm_site_id')!;

    final manager = $$FarmSitesTableTableManager($_db, $_db.farmSites)
        .filter((f) => f.farmSiteId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_farmSiteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _createdUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.farmFields.createdUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get createdUserId {
    final $_column = $_itemColumn<int>('created_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _modifiedUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.farmFields.modifiedUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get modifiedUserId {
    final $_column = $_itemColumn<int>('modified_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modifiedUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$WorkTasksTable, List<WorkTask>>
      _workTasksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.workTasks,
              aliasName: $_aliasNameGenerator(
                  db.farmFields.farmFieldId, db.workTasks.farmFieldId));

  $$WorkTasksTableProcessedTableManager get workTasksRefs {
    final manager = $$WorkTasksTableTableManager($_db, $_db.workTasks).filter(
        (f) => f.farmFieldId.farmFieldId
            .sqlEquals($_itemColumn<int>('farm_field_id')!));

    final cache = $_typedResult.readTableOrNull(_workTasksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FarmFieldsTableFilterComposer
    extends Composer<_$AppDatabase, $FarmFieldsTable> {
  $$FarmFieldsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get farmFieldId => $composableBuilder(
      column: $table.farmFieldId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmFieldName => $composableBuilder(
      column: $table.farmFieldName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmFieldCode => $composableBuilder(
      column: $table.farmFieldCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rowWidth => $composableBuilder(
      column: $table.rowWidth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmFieldRowDirection => $composableBuilder(
      column: $table.farmFieldRowDirection,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmFieldColorHexCode => $composableBuilder(
      column: $table.farmFieldColorHexCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$FarmSitesTableFilterComposer get farmSiteId {
    final $$FarmSitesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmSiteId,
        referencedTable: $db.farmSites,
        getReferencedColumn: (t) => t.farmSiteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmSitesTableFilterComposer(
              $db: $db,
              $table: $db.farmSites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get createdUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get modifiedUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> workTasksRefs(
      Expression<bool> Function($$WorkTasksTableFilterComposer f) f) {
    final $$WorkTasksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmFieldId,
        referencedTable: $db.workTasks,
        getReferencedColumn: (t) => t.farmFieldId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTasksTableFilterComposer(
              $db: $db,
              $table: $db.workTasks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FarmFieldsTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmFieldsTable> {
  $$FarmFieldsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get farmFieldId => $composableBuilder(
      column: $table.farmFieldId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmFieldName => $composableBuilder(
      column: $table.farmFieldName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmFieldCode => $composableBuilder(
      column: $table.farmFieldCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rowWidth => $composableBuilder(
      column: $table.rowWidth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmFieldRowDirection => $composableBuilder(
      column: $table.farmFieldRowDirection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmFieldColorHexCode => $composableBuilder(
      column: $table.farmFieldColorHexCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$FarmSitesTableOrderingComposer get farmSiteId {
    final $$FarmSitesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmSiteId,
        referencedTable: $db.farmSites,
        getReferencedColumn: (t) => t.farmSiteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmSitesTableOrderingComposer(
              $db: $db,
              $table: $db.farmSites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get createdUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get modifiedUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FarmFieldsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmFieldsTable> {
  $$FarmFieldsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get farmFieldId => $composableBuilder(
      column: $table.farmFieldId, builder: (column) => column);

  GeneratedColumn<String> get farmFieldName => $composableBuilder(
      column: $table.farmFieldName, builder: (column) => column);

  GeneratedColumn<String> get farmFieldCode => $composableBuilder(
      column: $table.farmFieldCode, builder: (column) => column);

  GeneratedColumn<double> get rowWidth =>
      $composableBuilder(column: $table.rowWidth, builder: (column) => column);

  GeneratedColumn<String> get farmFieldRowDirection => $composableBuilder(
      column: $table.farmFieldRowDirection, builder: (column) => column);

  GeneratedColumn<String> get farmFieldColorHexCode => $composableBuilder(
      column: $table.farmFieldColorHexCode, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$FarmSitesTableAnnotationComposer get farmSiteId {
    final $$FarmSitesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmSiteId,
        referencedTable: $db.farmSites,
        getReferencedColumn: (t) => t.farmSiteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmSitesTableAnnotationComposer(
              $db: $db,
              $table: $db.farmSites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get createdUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get modifiedUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> workTasksRefs<T extends Object>(
      Expression<T> Function($$WorkTasksTableAnnotationComposer a) f) {
    final $$WorkTasksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmFieldId,
        referencedTable: $db.workTasks,
        getReferencedColumn: (t) => t.farmFieldId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTasksTableAnnotationComposer(
              $db: $db,
              $table: $db.workTasks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FarmFieldsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FarmFieldsTable,
    FarmField,
    $$FarmFieldsTableFilterComposer,
    $$FarmFieldsTableOrderingComposer,
    $$FarmFieldsTableAnnotationComposer,
    $$FarmFieldsTableCreateCompanionBuilder,
    $$FarmFieldsTableUpdateCompanionBuilder,
    (FarmField, $$FarmFieldsTableReferences),
    FarmField,
    PrefetchHooks Function(
        {bool farmSiteId,
        bool createdUserId,
        bool modifiedUserId,
        bool workTasksRefs})> {
  $$FarmFieldsTableTableManager(_$AppDatabase db, $FarmFieldsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmFieldsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmFieldsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmFieldsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> farmFieldId = const Value.absent(),
            Value<int> farmSiteId = const Value.absent(),
            Value<String> farmFieldName = const Value.absent(),
            Value<String?> farmFieldCode = const Value.absent(),
            Value<double?> rowWidth = const Value.absent(),
            Value<String?> farmFieldRowDirection = const Value.absent(),
            Value<String?> farmFieldColorHexCode = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              FarmFieldsCompanion(
            farmFieldId: farmFieldId,
            farmSiteId: farmSiteId,
            farmFieldName: farmFieldName,
            farmFieldCode: farmFieldCode,
            rowWidth: rowWidth,
            farmFieldRowDirection: farmFieldRowDirection,
            farmFieldColorHexCode: farmFieldColorHexCode,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> farmFieldId = const Value.absent(),
            required int farmSiteId,
            required String farmFieldName,
            Value<String?> farmFieldCode = const Value.absent(),
            Value<double?> rowWidth = const Value.absent(),
            Value<String?> farmFieldRowDirection = const Value.absent(),
            Value<String?> farmFieldColorHexCode = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> primaryCropId = const Value.absent(),
          }) =>
              FarmFieldsCompanion.insert(
            farmFieldId: farmFieldId,
            farmSiteId: farmSiteId,
            farmFieldName: farmFieldName,
            farmFieldCode: farmFieldCode,
            rowWidth: rowWidth,
            farmFieldRowDirection: farmFieldRowDirection,
            farmFieldColorHexCode: farmFieldColorHexCode,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isDeleted: isDeleted,
            description: description,
            primaryCropId: primaryCropId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FarmFieldsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {farmSiteId = false,
              createdUserId = false,
              modifiedUserId = false,
              workTasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (workTasksRefs) db.workTasks],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (farmSiteId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.farmSiteId,
                    referencedTable:
                        $$FarmFieldsTableReferences._farmSiteIdTable(db),
                    referencedColumn: $$FarmFieldsTableReferences
                        ._farmSiteIdTable(db)
                        .farmSiteId,
                  ) as T;
                }
                if (createdUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdUserId,
                    referencedTable:
                        $$FarmFieldsTableReferences._createdUserIdTable(db),
                    referencedColumn: $$FarmFieldsTableReferences
                        ._createdUserIdTable(db)
                        .userId,
                  ) as T;
                }
                if (modifiedUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modifiedUserId,
                    referencedTable:
                        $$FarmFieldsTableReferences._modifiedUserIdTable(db),
                    referencedColumn: $$FarmFieldsTableReferences
                        ._modifiedUserIdTable(db)
                        .userId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workTasksRefs)
                    await $_getPrefetchedData<FarmField, $FarmFieldsTable,
                            WorkTask>(
                        currentTable: table,
                        referencedTable:
                            $$FarmFieldsTableReferences._workTasksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FarmFieldsTableReferences(db, table, p0)
                                .workTasksRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.farmFieldId == item.farmFieldId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FarmFieldsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FarmFieldsTable,
    FarmField,
    $$FarmFieldsTableFilterComposer,
    $$FarmFieldsTableOrderingComposer,
    $$FarmFieldsTableAnnotationComposer,
    $$FarmFieldsTableCreateCompanionBuilder,
    $$FarmFieldsTableUpdateCompanionBuilder,
    (FarmField, $$FarmFieldsTableReferences),
    FarmField,
    PrefetchHooks Function(
        {bool farmSiteId,
        bool createdUserId,
        bool modifiedUserId,
        bool workTasksRefs})>;
typedef $$WorkTaskTypesTableCreateCompanionBuilder = WorkTaskTypesCompanion
    Function({
  required String workTaskTypeCode,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$WorkTaskTypesTableUpdateCompanionBuilder = WorkTaskTypesCompanion
    Function({
  Value<String> workTaskTypeCode,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isDeleted,
  Value<int> rowid,
});

final class $$WorkTaskTypesTableReferences
    extends BaseReferences<_$AppDatabase, $WorkTaskTypesTable, WorkTaskType> {
  $$WorkTaskTypesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _createdUserIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(
          db.workTaskTypes.createdUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get createdUserId {
    final $_column = $_itemColumn<int>('created_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _modifiedUserIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(
          db.workTaskTypes.modifiedUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get modifiedUserId {
    final $_column = $_itemColumn<int>('modified_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modifiedUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$WorkTasksTable, List<WorkTask>>
      _workTasksRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.workTasks,
              aliasName: $_aliasNameGenerator(db.workTaskTypes.workTaskTypeCode,
                  db.workTasks.workTaskTypeCode));

  $$WorkTasksTableProcessedTableManager get workTasksRefs {
    final manager = $$WorkTasksTableTableManager($_db, $_db.workTasks).filter(
        (f) => f.workTaskTypeCode.workTaskTypeCode
            .sqlEquals($_itemColumn<String>('work_task_type_code')!));

    final cache = $_typedResult.readTableOrNull(_workTasksRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkTaskTypesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkTaskTypesTable> {
  $$WorkTaskTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get workTaskTypeCode => $composableBuilder(
      column: $table.workTaskTypeCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get createdUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get modifiedUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> workTasksRefs(
      Expression<bool> Function($$WorkTasksTableFilterComposer f) f) {
    final $$WorkTasksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTaskTypeCode,
        referencedTable: $db.workTasks,
        getReferencedColumn: (t) => t.workTaskTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTasksTableFilterComposer(
              $db: $db,
              $table: $db.workTasks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkTaskTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkTaskTypesTable> {
  $$WorkTaskTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get workTaskTypeCode => $composableBuilder(
      column: $table.workTaskTypeCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get createdUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get modifiedUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkTaskTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkTaskTypesTable> {
  $$WorkTaskTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get workTaskTypeCode => $composableBuilder(
      column: $table.workTaskTypeCode, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get createdUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get modifiedUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> workTasksRefs<T extends Object>(
      Expression<T> Function($$WorkTasksTableAnnotationComposer a) f) {
    final $$WorkTasksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTaskTypeCode,
        referencedTable: $db.workTasks,
        getReferencedColumn: (t) => t.workTaskTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTasksTableAnnotationComposer(
              $db: $db,
              $table: $db.workTasks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkTaskTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkTaskTypesTable,
    WorkTaskType,
    $$WorkTaskTypesTableFilterComposer,
    $$WorkTaskTypesTableOrderingComposer,
    $$WorkTaskTypesTableAnnotationComposer,
    $$WorkTaskTypesTableCreateCompanionBuilder,
    $$WorkTaskTypesTableUpdateCompanionBuilder,
    (WorkTaskType, $$WorkTaskTypesTableReferences),
    WorkTaskType,
    PrefetchHooks Function(
        {bool createdUserId, bool modifiedUserId, bool workTasksRefs})> {
  $$WorkTaskTypesTableTableManager(_$AppDatabase db, $WorkTaskTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkTaskTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkTaskTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkTaskTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> workTaskTypeCode = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkTaskTypesCompanion(
            workTaskTypeCode: workTaskTypeCode,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String workTaskTypeCode,
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkTaskTypesCompanion.insert(
            workTaskTypeCode: workTaskTypeCode,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkTaskTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {createdUserId = false,
              modifiedUserId = false,
              workTasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (workTasksRefs) db.workTasks],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (createdUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdUserId,
                    referencedTable:
                        $$WorkTaskTypesTableReferences._createdUserIdTable(db),
                    referencedColumn: $$WorkTaskTypesTableReferences
                        ._createdUserIdTable(db)
                        .userId,
                  ) as T;
                }
                if (modifiedUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modifiedUserId,
                    referencedTable:
                        $$WorkTaskTypesTableReferences._modifiedUserIdTable(db),
                    referencedColumn: $$WorkTaskTypesTableReferences
                        ._modifiedUserIdTable(db)
                        .userId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workTasksRefs)
                    await $_getPrefetchedData<WorkTaskType, $WorkTaskTypesTable,
                            WorkTask>(
                        currentTable: table,
                        referencedTable: $$WorkTaskTypesTableReferences
                            ._workTasksRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkTaskTypesTableReferences(db, table, p0)
                                .workTasksRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) =>
                                e.workTaskTypeCode == item.workTaskTypeCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkTaskTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkTaskTypesTable,
    WorkTaskType,
    $$WorkTaskTypesTableFilterComposer,
    $$WorkTaskTypesTableOrderingComposer,
    $$WorkTaskTypesTableAnnotationComposer,
    $$WorkTaskTypesTableCreateCompanionBuilder,
    $$WorkTaskTypesTableUpdateCompanionBuilder,
    (WorkTaskType, $$WorkTaskTypesTableReferences),
    WorkTaskType,
    PrefetchHooks Function(
        {bool createdUserId, bool modifiedUserId, bool workTasksRefs})>;
typedef $$WorkTasksTableCreateCompanionBuilder = WorkTasksCompanion Function({
  Value<int> workTaskId,
  required int farmFieldId,
  required String workTaskTypeCode,
  Value<String> workTaskStatusCode,
  Value<DateTime?> startedDate,
  Value<DateTime?> cancelledDate,
  Value<DateTime?> dueDate,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isCompleted,
  Value<bool> isDeleted,
  Value<bool> isStarted,
  Value<bool> isCancelled,
});
typedef $$WorkTasksTableUpdateCompanionBuilder = WorkTasksCompanion Function({
  Value<int> workTaskId,
  Value<int> farmFieldId,
  Value<String> workTaskTypeCode,
  Value<String> workTaskStatusCode,
  Value<DateTime?> startedDate,
  Value<DateTime?> cancelledDate,
  Value<DateTime?> dueDate,
  Value<DateTime?> createdDate,
  Value<int?> createdUserId,
  Value<DateTime?> modifiedDate,
  Value<int?> modifiedUserId,
  Value<bool> isCompleted,
  Value<bool> isDeleted,
  Value<bool> isStarted,
  Value<bool> isCancelled,
});

final class $$WorkTasksTableReferences
    extends BaseReferences<_$AppDatabase, $WorkTasksTable, WorkTask> {
  $$WorkTasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FarmFieldsTable _farmFieldIdTable(_$AppDatabase db) =>
      db.farmFields.createAlias($_aliasNameGenerator(
          db.workTasks.farmFieldId, db.farmFields.farmFieldId));

  $$FarmFieldsTableProcessedTableManager get farmFieldId {
    final $_column = $_itemColumn<int>('farm_field_id')!;

    final manager = $$FarmFieldsTableTableManager($_db, $_db.farmFields)
        .filter((f) => f.farmFieldId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_farmFieldIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WorkTaskTypesTable _workTaskTypeCodeTable(_$AppDatabase db) =>
      db.workTaskTypes.createAlias($_aliasNameGenerator(
          db.workTasks.workTaskTypeCode, db.workTaskTypes.workTaskTypeCode));

  $$WorkTaskTypesTableProcessedTableManager get workTaskTypeCode {
    final $_column = $_itemColumn<String>('work_task_type_code')!;

    final manager = $$WorkTaskTypesTableTableManager($_db, $_db.workTaskTypes)
        .filter((f) => f.workTaskTypeCode.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workTaskTypeCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _createdUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.workTasks.createdUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get createdUserId {
    final $_column = $_itemColumn<int>('created_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _modifiedUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.workTasks.modifiedUserId, db.users.userId));

  $$UsersTableProcessedTableManager? get modifiedUserId {
    final $_column = $_itemColumn<int>('modified_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modifiedUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WorkTasksTableFilterComposer
    extends Composer<_$AppDatabase, $WorkTasksTable> {
  $$WorkTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get workTaskId => $composableBuilder(
      column: $table.workTaskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workTaskStatusCode => $composableBuilder(
      column: $table.workTaskStatusCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedDate => $composableBuilder(
      column: $table.startedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cancelledDate => $composableBuilder(
      column: $table.cancelledDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isStarted => $composableBuilder(
      column: $table.isStarted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCancelled => $composableBuilder(
      column: $table.isCancelled, builder: (column) => ColumnFilters(column));

  $$FarmFieldsTableFilterComposer get farmFieldId {
    final $$FarmFieldsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmFieldId,
        referencedTable: $db.farmFields,
        getReferencedColumn: (t) => t.farmFieldId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmFieldsTableFilterComposer(
              $db: $db,
              $table: $db.farmFields,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WorkTaskTypesTableFilterComposer get workTaskTypeCode {
    final $$WorkTaskTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTaskTypeCode,
        referencedTable: $db.workTaskTypes,
        getReferencedColumn: (t) => t.workTaskTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTaskTypesTableFilterComposer(
              $db: $db,
              $table: $db.workTaskTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get createdUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get modifiedUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkTasksTable> {
  $$WorkTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get workTaskId => $composableBuilder(
      column: $table.workTaskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workTaskStatusCode => $composableBuilder(
      column: $table.workTaskStatusCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedDate => $composableBuilder(
      column: $table.startedDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cancelledDate => $composableBuilder(
      column: $table.cancelledDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isStarted => $composableBuilder(
      column: $table.isStarted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCancelled => $composableBuilder(
      column: $table.isCancelled, builder: (column) => ColumnOrderings(column));

  $$FarmFieldsTableOrderingComposer get farmFieldId {
    final $$FarmFieldsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmFieldId,
        referencedTable: $db.farmFields,
        getReferencedColumn: (t) => t.farmFieldId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmFieldsTableOrderingComposer(
              $db: $db,
              $table: $db.farmFields,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WorkTaskTypesTableOrderingComposer get workTaskTypeCode {
    final $$WorkTaskTypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTaskTypeCode,
        referencedTable: $db.workTaskTypes,
        getReferencedColumn: (t) => t.workTaskTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTaskTypesTableOrderingComposer(
              $db: $db,
              $table: $db.workTaskTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get createdUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get modifiedUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkTasksTable> {
  $$WorkTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get workTaskId => $composableBuilder(
      column: $table.workTaskId, builder: (column) => column);

  GeneratedColumn<String> get workTaskStatusCode => $composableBuilder(
      column: $table.workTaskStatusCode, builder: (column) => column);

  GeneratedColumn<DateTime> get startedDate => $composableBuilder(
      column: $table.startedDate, builder: (column) => column);

  GeneratedColumn<DateTime> get cancelledDate => $composableBuilder(
      column: $table.cancelledDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedDate => $composableBuilder(
      column: $table.modifiedDate, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<bool> get isStarted =>
      $composableBuilder(column: $table.isStarted, builder: (column) => column);

  GeneratedColumn<bool> get isCancelled => $composableBuilder(
      column: $table.isCancelled, builder: (column) => column);

  $$FarmFieldsTableAnnotationComposer get farmFieldId {
    final $$FarmFieldsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.farmFieldId,
        referencedTable: $db.farmFields,
        getReferencedColumn: (t) => t.farmFieldId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FarmFieldsTableAnnotationComposer(
              $db: $db,
              $table: $db.farmFields,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WorkTaskTypesTableAnnotationComposer get workTaskTypeCode {
    final $$WorkTaskTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTaskTypeCode,
        referencedTable: $db.workTaskTypes,
        getReferencedColumn: (t) => t.workTaskTypeCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTaskTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.workTaskTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get createdUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.createdUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get modifiedUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifiedUserId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkTasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkTasksTable,
    WorkTask,
    $$WorkTasksTableFilterComposer,
    $$WorkTasksTableOrderingComposer,
    $$WorkTasksTableAnnotationComposer,
    $$WorkTasksTableCreateCompanionBuilder,
    $$WorkTasksTableUpdateCompanionBuilder,
    (WorkTask, $$WorkTasksTableReferences),
    WorkTask,
    PrefetchHooks Function(
        {bool farmFieldId,
        bool workTaskTypeCode,
        bool createdUserId,
        bool modifiedUserId})> {
  $$WorkTasksTableTableManager(_$AppDatabase db, $WorkTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> workTaskId = const Value.absent(),
            Value<int> farmFieldId = const Value.absent(),
            Value<String> workTaskTypeCode = const Value.absent(),
            Value<String> workTaskStatusCode = const Value.absent(),
            Value<DateTime?> startedDate = const Value.absent(),
            Value<DateTime?> cancelledDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<bool> isStarted = const Value.absent(),
            Value<bool> isCancelled = const Value.absent(),
          }) =>
              WorkTasksCompanion(
            workTaskId: workTaskId,
            farmFieldId: farmFieldId,
            workTaskTypeCode: workTaskTypeCode,
            workTaskStatusCode: workTaskStatusCode,
            startedDate: startedDate,
            cancelledDate: cancelledDate,
            dueDate: dueDate,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isCompleted: isCompleted,
            isDeleted: isDeleted,
            isStarted: isStarted,
            isCancelled: isCancelled,
          ),
          createCompanionCallback: ({
            Value<int> workTaskId = const Value.absent(),
            required int farmFieldId,
            required String workTaskTypeCode,
            Value<String> workTaskStatusCode = const Value.absent(),
            Value<DateTime?> startedDate = const Value.absent(),
            Value<DateTime?> cancelledDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
            Value<int?> createdUserId = const Value.absent(),
            Value<DateTime?> modifiedDate = const Value.absent(),
            Value<int?> modifiedUserId = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<bool> isStarted = const Value.absent(),
            Value<bool> isCancelled = const Value.absent(),
            Value<String> taskName = const Value.absent(),
            Value<String> instruction = const Value.absent(),
            Value<String> dueType = const Value.absent(),
          }) =>
              WorkTasksCompanion.insert(
            workTaskId: workTaskId,
            farmFieldId: farmFieldId,
            workTaskTypeCode: workTaskTypeCode,
            workTaskStatusCode: workTaskStatusCode,
            startedDate: startedDate,
            cancelledDate: cancelledDate,
            dueDate: dueDate,
            createdDate: createdDate,
            createdUserId: createdUserId,
            modifiedDate: modifiedDate,
            modifiedUserId: modifiedUserId,
            isCompleted: isCompleted,
            isDeleted: isDeleted,
            isStarted: isStarted,
            isCancelled: isCancelled, taskName: taskName, instruction: instruction, dueType: dueType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkTasksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {farmFieldId = false,
              workTaskTypeCode = false,
              createdUserId = false,
              modifiedUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (farmFieldId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.farmFieldId,
                    referencedTable:
                        $$WorkTasksTableReferences._farmFieldIdTable(db),
                    referencedColumn: $$WorkTasksTableReferences
                        ._farmFieldIdTable(db)
                        .farmFieldId,
                  ) as T;
                }
                if (workTaskTypeCode) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workTaskTypeCode,
                    referencedTable:
                        $$WorkTasksTableReferences._workTaskTypeCodeTable(db),
                    referencedColumn: $$WorkTasksTableReferences
                        ._workTaskTypeCodeTable(db)
                        .workTaskTypeCode,
                  ) as T;
                }
                if (createdUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.createdUserId,
                    referencedTable:
                        $$WorkTasksTableReferences._createdUserIdTable(db),
                    referencedColumn: $$WorkTasksTableReferences
                        ._createdUserIdTable(db)
                        .userId,
                  ) as T;
                }
                if (modifiedUserId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modifiedUserId,
                    referencedTable:
                        $$WorkTasksTableReferences._modifiedUserIdTable(db),
                    referencedColumn: $$WorkTasksTableReferences
                        ._modifiedUserIdTable(db)
                        .userId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WorkTasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkTasksTable,
    WorkTask,
    $$WorkTasksTableFilterComposer,
    $$WorkTasksTableOrderingComposer,
    $$WorkTasksTableAnnotationComposer,
    $$WorkTasksTableCreateCompanionBuilder,
    $$WorkTasksTableUpdateCompanionBuilder,
    (WorkTask, $$WorkTasksTableReferences),
    WorkTask,
    PrefetchHooks Function(
        {bool farmFieldId,
        bool workTaskTypeCode,
        bool createdUserId,
        bool modifiedUserId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$CropsTableTableManager get crops =>
      $$CropsTableTableManager(_db, _db.crops);
  $$FarmSitesTableTableManager get farmSites =>
      $$FarmSitesTableTableManager(_db, _db.farmSites);
  $$FarmFieldsTableTableManager get farmFields =>
      $$FarmFieldsTableTableManager(_db, _db.farmFields);
  $$WorkTaskTypesTableTableManager get workTaskTypes =>
      $$WorkTaskTypesTableTableManager(_db, _db.workTaskTypes);
  $$WorkTasksTableTableManager get workTasks =>
      $$WorkTasksTableTableManager(_db, _db.workTasks);
}

mixin _$FarmSitesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $CropsTable get crops => attachedDatabase.crops;
  $FarmSitesTable get farmSites => attachedDatabase.farmSites;
}
mixin _$FarmFieldsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $CropsTable get crops => attachedDatabase.crops;
  $FarmSitesTable get farmSites => attachedDatabase.farmSites;
  $FarmFieldsTable get farmFields => attachedDatabase.farmFields;
}
mixin _$WorkTasksDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $CropsTable get crops => attachedDatabase.crops;
  $FarmSitesTable get farmSites => attachedDatabase.farmSites;
  $FarmFieldsTable get farmFields => attachedDatabase.farmFields;
  $WorkTaskTypesTable get workTaskTypes => attachedDatabase.workTaskTypes;
  $WorkTasksTable get workTasks => attachedDatabase.workTasks;
}
mixin _$WorkTaskTypesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $WorkTaskTypesTable get workTaskTypes => attachedDatabase.workTaskTypes;
}
mixin _$CropsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $CropsTable get crops => attachedDatabase.crops;
}
mixin _$UsersDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
