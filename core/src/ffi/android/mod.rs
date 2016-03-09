#![allow(non_camel_case_types, non_snake_case, dead_code, unused_variables, improper_ctypes, non_upper_case_globals)]

extern crate libc;
use std::ffi::{CString};

use android_glue;

/// Returns the current Context.
fn get_context() -> &'static android_glue::Context {
    let context = unsafe { (*android_glue::ANDROID_APP).userData };
    unsafe { mem::transmute(context) }
}

#[no_mangle]
pub extern fn get_mobile_greeting(greeting: &mut *const libc::c_char) {
    let ctx = get_context();
}

#[no_mangle]
pub extern fn log_message(msg: *const libc::c_char) {
    let tag = CString::new("rust-core-android").unwrap();
    let tag = tag.as_ptr();
    unsafe {
        android_glue::ffi::__android_log_write(3, tag, msg)
    };
}
