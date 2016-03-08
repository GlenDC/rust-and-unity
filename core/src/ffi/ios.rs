extern crate libc;

extern "C" {
    fn logMessage(message: *const libc::c_char);
}

#[no_mangle]
pub extern fn log_message(msg: *const libc::c_char) {
    unsafe {
        logMessage(msg)
    }
}
