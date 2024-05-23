// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `My Rooms`
  String get myRooms {
    return Intl.message(
      'My Rooms',
      name: 'myRooms',
      desc: '',
      args: [],
    );
  }

  /// `My Schedule`
  String get mySchedule {
    return Intl.message(
      'My Schedule',
      name: 'mySchedule',
      desc: '',
      args: [],
    );
  }

  /// `My Profit Requests`
  String get myProfits {
    return Intl.message(
      'My Profit Requests',
      name: 'myProfits',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get about {
    return Intl.message(
      'About us',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Apply for partnership`
  String get apply {
    return Intl.message(
      'Apply for partnership',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get confPassword {
    return Intl.message(
      'Password Confirmation',
      name: 'confPassword',
      desc: '',
      args: [],
    );
  }

  /// `Investor`
  String get investor {
    return Intl.message(
      'Investor',
      name: 'investor',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get attachment {
    return Intl.message(
      'Attachment',
      name: 'attachment',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp number`
  String get wpPhone {
    return Intl.message(
      'Whatsapp number',
      name: 'wpPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enable Whatsapp notifications`
  String get enable {
    return Intl.message(
      'Enable Whatsapp notifications',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `Sessions`
  String get session {
    return Intl.message(
      'Sessions',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `Profits`
  String get profits {
    return Intl.message(
      'Profits',
      name: 'profits',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get rooms {
    return Intl.message(
      'Rooms',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Profit Request Details`
  String get profitDetails {
    return Intl.message(
      'Profit Request Details',
      name: 'profitDetails',
      desc: '',
      args: [],
    );
  }

  /// `Room Details`
  String get roomDetails {
    return Intl.message(
      'Room Details',
      name: 'roomDetails',
      desc: '',
      args: [],
    );
  }

  /// `Time Slot`
  String get timeSlot {
    return Intl.message(
      'Time Slot',
      name: 'timeSlot',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Similar Services`
  String get similarServices {
    return Intl.message(
      'Similar Services',
      name: 'similarServices',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current Password`
  String get enterCurrentPassword {
    return Intl.message(
      'Enter Current Password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Confirmation Password`
  String get enterNewPasswordConf {
    return Intl.message(
      'Enter Confirmation Password',
      name: 'enterNewPasswordConf',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get currentWord {
    return Intl.message(
      'Current',
      name: 'currentWord',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Not Attended`
  String get notAttended {
    return Intl.message(
      'Not Attended',
      name: 'notAttended',
      desc: '',
      args: [],
    );
  }

  /// `Attended`
  String get attended {
    return Intl.message(
      'Attended',
      name: 'attended',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Patient Info`
  String get patientInfo {
    return Intl.message(
      'Patient Info',
      name: 'patientInfo',
      desc: '',
      args: [],
    );
  }

  /// `Patient Notes`
  String get patientNotes {
    return Intl.message(
      'Patient Notes',
      name: 'patientNotes',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message(
      'Remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get taxes {
    return Intl.message(
      'Taxes',
      name: 'taxes',
      desc: '',
      args: [],
    );
  }

  /// `Total Taxes`
  String get totalTaxes {
    return Intl.message(
      'Total Taxes',
      name: 'totalTaxes',
      desc: '',
      args: [],
    );
  }

  /// `No Payments Yet!`
  String get noPayment {
    return Intl.message(
      'No Payments Yet!',
      name: 'noPayment',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout successfully`
  String get logoutSuccessfully {
    return Intl.message(
      'Logout successfully',
      name: 'logoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have an Account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t Have an Account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Exit From Application`
  String get exit {
    return Intl.message(
      'Exit From Application',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Do you Want to Exit`
  String get exitQuestion {
    return Intl.message(
      'Do you Want to Exit',
      name: 'exitQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account first`
  String get loginFirst {
    return Intl.message(
      'Login to your account first',
      name: 'loginFirst',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue using the app`
  String get loginMessage {
    return Intl.message(
      'Login to continue using the app',
      name: 'loginMessage',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Apply Now`
  String get applyNow {
    return Intl.message(
      'Apply Now',
      name: 'applyNow',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get haveAnAccount {
    return Intl.message(
      'Have an account?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Request Subject`
  String get requestSubject {
    return Intl.message(
      'Request Subject',
      name: 'requestSubject',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message here`
  String get enterYourMessage {
    return Intl.message(
      'Enter your message here',
      name: 'enterYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been sent successfully`
  String get yourRequestSentSuccessfully {
    return Intl.message(
      'Your request has been sent successfully',
      name: 'yourRequestSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get checkInternet {
    return Intl.message(
      'Check your internet connection',
      name: 'checkInternet',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error, try again later`
  String get errorHappenedUnExpected {
    return Intl.message(
      'Unexpected error, try again later',
      name: 'errorHappenedUnExpected',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get applyBtn {
    return Intl.message(
      'Apply',
      name: 'applyBtn',
      desc: '',
      args: [],
    );
  }

  /// `You must add one file at least`
  String get addFile {
    return Intl.message(
      'You must add one file at least',
      name: 'addFile',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Another Phone`
  String get anotherPhone {
    return Intl.message(
      'Another Phone',
      name: 'anotherPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Personal Information`
  String get personalInfo {
    return Intl.message(
      'Enter Your Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Do not t worry ! It happens. Please enter the phone number we will send the OTP in this email address.`
  String get forgetPasswordMessage {
    return Intl.message(
      'Do not t worry ! It happens. Please enter the phone number we will send the OTP in this email address.',
      name: 'forgetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To TriCare`
  String get board1Title {
    return Intl.message(
      'Welcome To TriCare',
      name: 'board1Title',
      desc: '',
      args: [],
    );
  }

  /// `Your Health Your Way`
  String get board2Title {
    return Intl.message(
      'Your Health Your Way',
      name: 'board2Title',
      desc: '',
      args: [],
    );
  }

  /// `Connect With TriCare`
  String get board3Title {
    return Intl.message(
      'Connect With TriCare',
      name: 'board3Title',
      desc: '',
      args: [],
    );
  }

  /// `welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips`
  String get introDescription {
    return Intl.message(
      'welcome to TriCare, your trusted companion for personalized medical care. Experience a new era of healthcare right at your fingertips',
      name: 'introDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter As Gust`
  String get guest {
    return Intl.message(
      'Enter As Gust',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Profit Order`
  String get profitOrder {
    return Intl.message(
      'Profit Order',
      name: 'profitOrder',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp`
  String get whatsapp {
    return Intl.message(
      'Whatsapp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp notifications`
  String get wpNotifications {
    return Intl.message(
      'Whatsapp notifications',
      name: 'wpNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Add new order`
  String get addNewOrder {
    return Intl.message(
      'Add new order',
      name: 'addNewOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your balance`
  String get balance {
    return Intl.message(
      'Your balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Profit Request added successfully`
  String get profitReqAddedSuccessfully {
    return Intl.message(
      'Profit Request added successfully',
      name: 'profitReqAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Amount value cannot be empty`
  String get amountValidation {
    return Intl.message(
      'Amount value cannot be empty',
      name: 'amountValidation',
      desc: '',
      args: [],
    );
  }

  /// `Amount value cannot be null`
  String get amountValidationNull {
    return Intl.message(
      'Amount value cannot be null',
      name: 'amountValidationNull',
      desc: '',
      args: [],
    );
  }

  /// `Request amount more than your balance`
  String get requestedAmountMoreThanBalance {
    return Intl.message(
      'Request amount more than your balance',
      name: 'requestedAmountMoreThanBalance',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to our`
  String get byContinue {
    return Intl.message(
      'By continuing, you agree to our',
      name: 'byContinue',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get tos {
    return Intl.message(
      'Terms of Service',
      name: 'tos',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get requested {
    return Intl.message(
      'Request',
      name: 'requested',
      desc: '',
      args: [],
    );
  }

  /// `Your Password`
  String get urPassword {
    return Intl.message(
      'Your Password',
      name: 'urPassword',
      desc: '',
      args: [],
    );
  }

  /// `Profit Request`
  String get profitReq {
    return Intl.message(
      'Profit Request',
      name: 'profitReq',
      desc: '',
      args: [],
    );
  }

  /// `Show Details`
  String get showDetails {
    return Intl.message(
      'Show Details',
      name: 'showDetails',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message(
      'Branch',
      name: 'branch',
      desc: '',
      args: [],
    );
  }

  /// `Show Timeslot`
  String get showTimeSlot {
    return Intl.message(
      'Show Timeslot',
      name: 'showTimeSlot',
      desc: '',
      args: [],
    );
  }

  /// `Session Details`
  String get sessionDetails {
    return Intl.message(
      'Session Details',
      name: 'sessionDetails',
      desc: '',
      args: [],
    );
  }

  /// `Session`
  String get sessionTxt {
    return Intl.message(
      'Session',
      name: 'sessionTxt',
      desc: '',
      args: [],
    );
  }

  /// `My Sessions`
  String get mySessions {
    return Intl.message(
      'My Sessions',
      name: 'mySessions',
      desc: '',
      args: [],
    );
  }

  /// `Don't have any notifications`
  String get dontHaveNotifications {
    return Intl.message(
      'Don\'t have any notifications',
      name: 'dontHaveNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Empty Data in This Screen`
  String get emptyData {
    return Intl.message(
      'Empty Data in This Screen',
      name: 'emptyData',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get emailValidation {
    return Intl.message(
      'Please Enter Your Email',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Request Subject`
  String get subjectValidation {
    return Intl.message(
      'Please Enter Your Request Subject',
      name: 'subjectValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Message`
  String get messageValidation {
    return Intl.message(
      'Please Enter Your Message',
      name: 'messageValidation',
      desc: '',
      args: [],
    );
  }

  /// `Phone Must Be 11 Number`
  String get phoneValidation {
    return Intl.message(
      'Phone Must Be 11 Number',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name`
  String get nameValidation {
    return Intl.message(
      'Please Enter Your Name',
      name: 'nameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Verification Code`
  String get otpValidation {
    return Intl.message(
      'Please Enter Your Verification Code',
      name: 'otpValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password`
  String get passwordValidation {
    return Intl.message(
      'Please Enter Your Password',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Password is to week`
  String get weakPassword {
    return Intl.message(
      'Password is to week',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check Your`
  String get check {
    return Intl.message(
      'Check Your',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Your Attachments`
  String get yourAttachments {
    return Intl.message(
      'Your Attachments',
      name: 'yourAttachments',
      desc: '',
      args: [],
    );
  }

  /// `Allowed Extensions[pdf,jpg,jpeg,png] max 5MB`
  String get allowedExtensions {
    return Intl.message(
      'Allowed Extensions[pdf,jpg,jpeg,png] max 5MB',
      name: 'allowedExtensions',
      desc: '',
      args: [],
    );
  }

  /// `Make sure each file has a unique name`
  String get makeSure {
    return Intl.message(
      'Make sure each file has a unique name',
      name: 'makeSure',
      desc: '',
      args: [],
    );
  }

  /// `Want to remove this file?`
  String get removeFile {
    return Intl.message(
      'Want to remove this file?',
      name: 'removeFile',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
