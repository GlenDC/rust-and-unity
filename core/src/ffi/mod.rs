/*#![cfg(target_os = "android")]
pub mod android;*/
#![cfg(target_os = "ios")]
pub mod ios;

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

#[no_mangle]
pub extern fn array_letter_count(msgs: &[*const libc::c_char]) -> libc::c_int {
    let mut c : libc::c_int = 0;
    for &msg in msgs.iter() {
        unsafe {
            let slice = ffi::CStr::from_ptr(msg);
            c += slice.to_bytes().len() as libc::c_int;
        }
    }

    return c;
}

#[derive(Debug)]
pub enum RCType {
    Int(i32),
    Float(f32),
}

#[derive(Debug)]
pub struct RustCollection {
    values : Vec<RCType>,
}

impl RustCollection {
    fn new() -> RustCollection {
        RustCollection { values: Vec::new() }
    }

    fn add_int(&mut self, value: i32) {
        self.values.push(RCType::Int(value));
    }

    fn add_float(&mut self, value: f32) {
        self.values.push(RCType::Float(value));
    }

    fn count(&self) -> usize {
        self.values.len()
    }
}

impl Drop for RustCollection {
    fn drop(&mut self) {
        println!("{:?} is being deallocated", self);
    }
}

#[no_mangle]
pub extern fn rust_collection_new() -> *mut RustCollection {
    let rust_collection = RustCollection::new();
    let boxed_data = Box::new(rust_collection);
    Box::into_raw(boxed_data)
}

#[no_mangle]
pub unsafe extern fn rust_collection_destroy(collection: *mut RustCollection) {
    if !collection.is_null() {
        let _ = Box::from_raw(collection);
    }
}

#[no_mangle]
pub extern fn rust_collection_add_int(collection: *mut RustCollection, value: libc::c_int) {
    if !collection.is_null() {
        let collection = unsafe { &mut *collection };
        collection.add_int(value as i32);
    }
}

#[no_mangle]
pub extern fn rust_collection_add_float(collection: *mut RustCollection, value: libc::c_float) {
    if !collection.is_null() {
        let collection = unsafe { &mut *collection };
        collection.add_float(value as f32);
    }
}

#[no_mangle]
pub extern fn rust_collection_length(collection: *const RustCollection) -> libc::c_uint {
    if collection.is_null() {
        return 0;
    }

    let collection = unsafe { &*collection };
    collection.count() as libc::c_uint
}
