using UnityEngine;
using System.Collections;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

public class CoreAPI {
	[DllImport("libcore")]
	private static extern int letter_count(String msg);

	public static int LetterCount(string msg)
	{
		return letter_count(msg);
	}
}
