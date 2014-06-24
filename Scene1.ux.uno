using Uno;
using Uno.Collections;
using Uno.Scenes;
using Uno.UI;
using Experimental.Data;

using Postnummer;

public partial class Scene1
{
	Data d = new Data();

	string DefaultText = "SØKETEKST";

	void SearchButton_Click(object a1, Uno.UI.ClickEventArgs a2)
    {
		d.Search(InputBox.Text, Callback);
		
		ResultPanel.Visibility = Visibility.Collapsed;
		//LoadingElement1.Visibility = Visibility.Visible;
    }

	void InputBox_LostFocus(object a1, Uno.Scenes.SceneEventArgs a2)
    {
		if (InputBox.Text == DefaultText || InputBox.Text == "")
		{
			InputBox.Text = DefaultText;
			InputBox.TextColor = float4(0.8f, 0.8f, 0.8f, 255);
		}
    }


    void InputBox_GotFocus(object a1, Uno.Scenes.SceneEventArgs a2)
    {
		if (InputBox.Text == DefaultText)
		{
			InputBox.Text = "";
			InputBox.TextColor = float4(0.19f, 0.19f, 0.19f, 255);
		}
    }

	private void Callback(string content)
	{
		ResultPanel.Visibility = Visibility.Visible;
		//LoadingElement1.Visibility = Visibility.Collapsed;
		
		var jsonData = JsonReader.Parse(content);

		var json = jsonData["hits"]["hits"][0]["_source"];
		debug_log json["_index"].AsString();

		string place = json["area"].AsString().ToUpper();
		string zip = json["zip"].AsString();


		PlaceResult.Text = place;
		int fs = 100;
		if (place.Length > 8)
		{
			fs -= (place.Length - 8) * 5;
		}
		PlaceResult.FontSize = fs;

		ZipResult.Text = zip;
	}

    public Scene1()
    {
        InitializeUX();
    }
}
