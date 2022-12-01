knowwn issue

ASK [lookup secretsmanager secret in the current region] *************************************************************************************************************************
objc[6830]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called.
objc[6830]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.


to solve:
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES