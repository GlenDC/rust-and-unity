using UnityEngine;
using System.Collections;

using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

public class CoreAPI {
#if UNITY_IOS
	[DllImport("__Internal")]
	private static extern int letter_count([MarshalAs(UnmanagedType.LPStr)] string msg);

	[DllImport("__Internal")]
	private static extern int array_letter_count(
		[MarshalAs(UnmanagedType.LPArray, SizeParamIndex=1)] string[]arr, int size);

	[DllImport("__Internal")]
	private static extern void log_message([MarshalAs(UnmanagedType.LPStr)] string message);

	[DllImport("__Internal")]
	private static extern void get_mobile_greeting(out string message);
#else
	[DllImport("libcore")]
	private static extern int letter_count([MarshalAs(UnmanagedType.LPStr)] string msg);

	[DllImport("libcore")]
	private static extern int array_letter_count(
		[MarshalAs(UnmanagedType.LPArray, SizeParamIndex=1)] string[]arr, int size);

	[DllImport("libcore")]
	private static extern void log_message([MarshalAs(UnmanagedType.LPStr)] string message);

	[DllImport("libcore")]
	private static extern void get_mobile_greeting(out string message);
#endif

	public static int LetterCount(string msg)
	{
		return letter_count(msg);
	}

	public static int ArrayLetterCount(List<string> msgs)
	{
		return array_letter_count(msgs.ToArray(), msgs.Count);
	}

	public static void LogMessage(string message)
	{
		log_message(message);
	}

	public static string GetMobileGreeting()
	{
		string output;
		get_mobile_greeting(out output);
		return output;
	}
}
