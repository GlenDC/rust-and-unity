using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class ArrayLetterCount : MonoBehaviour {
	void Start () {
		// Simple String Stuff
		List<string> technologies = new List<string>(){
			"C#", "Rust", "C",
			"Android", "iOS", "Unity",
		};

		int n = 0;
		foreach (string str in technologies)
			n += str.Length;

		GetComponent<Text> ().text =
			string.Format ("Letter count for {0} words =>\n  Rust: {1}; C#: {2}", technologies.Count,
			               CoreAPI.ArrayLetterCount(technologies), n);
	}
}
