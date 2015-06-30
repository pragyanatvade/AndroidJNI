#include "com_onestep_pragyan_androidjni_MainActivity.h"
#include <stdio.h>
#include <android/log.h>

#define LOG_TAG "AndroidJNI"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define LOGV(...)  __android_log_print(ANDROID_LOG_VERBOSE, LOG_TAG,__VA_ARGS__)

#include <opencv2/core/core.hpp>

JNIEXPORT jstring JNICALL Java_com_onestep_pragyan_androidjni_MainActivity_startApp(JNIEnv *env, jclass obj, jstring Path)
{
	LOGV("Entered Native");
	const char* path = env->GetStringUTFChars(Path,NULL);
  LOGV("Exited Native");
	return Path;
}
