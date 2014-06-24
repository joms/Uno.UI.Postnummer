
using Uno;
using Uno.Collections;
using Uno.Scenes;
using Uno.UI;

public partial class LoadingElement
{
    public LoadingElement()
    {
        InitializeUX();
    }
	
	public void StartLoad()
	{
		Loading.Play();
	}
	
	public void StopLoad()
	{
		Loading.Stop();
	}
}
