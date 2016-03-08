using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class PlatformGreeter : MonoBehaviour {
	void Start () {
		// Simple String Stuff
		GetComponent<Text> ().text = CoreAPI.GetMobileGreeting();
	}
}
