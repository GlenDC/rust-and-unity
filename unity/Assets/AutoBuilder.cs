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
}
#endif
