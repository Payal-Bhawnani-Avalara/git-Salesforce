global class JobSandboxPostRefresh implements SandboxPostCopy {
    global void runApexClass(SandboxContext context) {
		JobUpdateEmailFields.runJobNow();	
    }
}