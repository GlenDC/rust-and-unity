extern crate libc;

use std::ffi::{CStr, CString};
use std::io::{self, Write};

#[no_mangle]
pub extern fn log_message(msg: *const libc::c_char) {
    unsafe {
        let slice = CStr::from_ptr(msg);
        let _ = slice.to_str().map(|s| {
            println!("{}", s);
            io::stdout().flush().unwrap();
        });
    }
}

#[no_mangle]
pub extern fn get_mobile_greeting(greeting: &mut *const libc::c_char)  {
    let _ = CString::new("Hello, this is rust talking from desktop").map(|s| {
        *greeting = s.into_raw();
    });
}
