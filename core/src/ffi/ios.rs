extern crate libc;

extern "C" {
    fn logMessage(message: *const libc::c_char);
    fn getMobileGreeting() -> *const libc::c_char;
}

#[no_mangle]
pub extern fn log_message(msg: *const libc::c_char) {
    unsafe {
        logMessage(msg)
    }
}

#[no_mangle]
pub extern fn get_mobile_greeting(greeting: &mut *const libc::c_char)  {
    unsafe {
        *greeting = getMobileGreeting();
    }
}
