using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class RustCollectionTester : MonoBehaviour {
	void Start () {
		var collection = new RustCollection();
		collection.AddInt(1);
		collection.AddFloat(4.2f);
		collection.AddInt(42);
		collection.AddFloat(13.37f);

		GetComponent<Text> ().text =
			string.Format ("Collection should have 4 elements: {0}", collection.Count);
	}
}
