extern crate libc;

use std::ffi;

#[no_mangle]
pub extern fn letter_count(msg: *const libc::c_char) -> libc::c_int {
    if msg.is_null() {
        return -1;
    }

    unsafe {
        let slice = ffi::CStr::from_ptr(msg);
        return slice.to_bytes().len() as libc::c_int;
    }
}
