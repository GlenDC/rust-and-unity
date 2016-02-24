using UnityEngine;
using System.Collections;

using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

public class CoreAPI {
	[DllImport("libcore")]
	private static extern int letter_count([MarshalAs(UnmanagedType.LPStr)] String msg);

	[DllImport("libcore")]
	private static extern int array_letter_count(
		[MarshalAs(UnmanagedType.LPArray, SizeParamIndex=1)] string[]arr, int size);

	public static int LetterCount(string msg)
	{
		return letter_count(msg);
	}

	public static int ArrayLetterCount(List<string> msgs)
	{
		return array_letter_count(msgs.ToArray(), msgs.Count);
	}
}
