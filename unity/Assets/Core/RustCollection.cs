using UnityEngine;
using System.Collections;
using System;
using System.Runtime.InteropServices;

public class RustCollection : IDisposable{
	private IntPtr m_RustObject;
	
#if UNITY_IOS
	[DllImport("__Internal")]
	private static extern IntPtr rust_collection_new();
	[DllImport("__Internal")]
	private static extern void rust_collection_destroy(IntPtr ptr);
	[DllImport("__Internal")]
	private static extern void rust_collection_add_int(IntPtr ptr, int value);
	[DllImport("__Internal")]
	private static extern void rust_collection_add_float(IntPtr ptr, float value);
	[DllImport("__Internal")]
	private static extern uint rust_collection_length(IntPtr ptr);
	#else
	[DllImport("libcore")]
	private static extern IntPtr rust_collection_new();
	[DllImport("libcore")]
	private static extern void rust_collection_destroy(IntPtr ptr);
	[DllImport("libcore")]
	private static extern void rust_collection_add_int(IntPtr ptr, int value);
	[DllImport("libcore")]
	private static extern void rust_collection_add_float(IntPtr ptr, float value);
	[DllImport("libcore")]
	private static extern uint rust_collection_length(IntPtr ptr);
#endif

	public uint Count
	{
		get {
			return rust_collection_length(m_RustObject);
		}
	}

	public RustCollection()
	{
		m_RustObject = rust_collection_new();
	}

	public void AddInt(int val)
	{
		rust_collection_add_int(m_RustObject, val);
	}

	public void AddFloat(float val)
	{
		rust_collection_add_float(m_RustObject, val);
	}

	public void Dispose()
	{
		rust_collection_destroy(m_RustObject);
	}
}
