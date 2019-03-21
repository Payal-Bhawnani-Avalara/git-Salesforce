@isTest
private Class AvalaraLoginCtrlTest{
    
    static testMethod void testLogin(){
        AvalaraLoginCtrl ctrl = new AvalaraLoginCtrl();
        ctrl.checkLogin();
        ctrl.username = 'test@test.com';
        ctrl.password = '00001111';
        ctrl.login();    
    }
    
    static testMethod void testReset(){
        AvalaraResetPasswordCtrl ctrl = new AvalaraResetPasswordCtrl ();
        ctrl.oldPassword  = '12323';
        ctrl.newPassword  = '1232312';
        ctrl.verifyNewPassword  = '1232312';
        ctrl.resetPassword();
    }
}