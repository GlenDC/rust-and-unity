#if UNITY_EDITOR
using UnityEditor;
using System.Diagnostics;

public class AutoBuilder
{
	public static void PerformiOSBuild()
	{
		// Get filename.
		string[] levels = new string[] {"Assets/TestScene.unity"};

		// Build player.
		BuildPipeline.BuildPlayer(
			levels,
			"Build-iOS",
			BuildTarget.iOS,
			BuildOptions.None);
	}

	public static void PerformAndroidBuild()
	{
		// Get filename.
		string[] levels = new string[] {"Assets/TestScene.unity"};

		// Build player.
		BuildPipeline.BuildPlayer(
			levels,
			"RustAndUnity.apk",
			BuildTarget.Android,
			BuildOptions.None);
	}
}
#endif
