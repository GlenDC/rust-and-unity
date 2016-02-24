using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class LetterCount : MonoBehaviour {
	void Start () {
		// Simple String Stuff
		string message = "Hello, World!";
		GetComponent<Text> ().text =
			string.Format ("{0} => \n  Rust: {1}; C#: {2}", message,
			              CoreAPI.LetterCount (message), message.Length);
	}
}
