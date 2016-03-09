#![allow(non_camel_case_types, non_snake_case, dead_code, unused_variables, improper_ctypes, non_upper_case_globals)]

extern crate libc;

#[repr(C)]
pub struct JNINativeInterface {
    reserved0: *mut libc::c_void,
    reserved1: *mut libc::c_void,
    reserved2: *mut libc::c_void,
    reserved3: *mut libc::c_void,

    GetVersion: extern fn(env: *mut JNIEnv) -> i32,

    _opaque_data: [u8; 1824]
}

pub type JNIEnv = *const JNINativeInterface;

unsafe fn java_multiply(a: i32, b: i32) -> i32 {

    /*jstring jstr = (*env)->NewStringUTF(env, "This comes from jni.");
    jclass clazz = (*env)->FindClass(env, "com/inceptix/android/t3d/MainActivity");
    jmethodID messageMe = (*env)->GetMethodID(env, clazz, "messageMe", "(Ljava/lang/String;)Ljava/lang/String;");
    jobject result = (*env)->CallObjectMethod(env, obj, messageMe, jstr);

    const char* str = (*env)->GetStringUTFChars(env,(jstring) result, NULL); // should be released but what a heck, it's a tutorial :)
    printf("%s\n", str);

    return (*env)->NewStringUTF(env, str);*/
    return 42
}
