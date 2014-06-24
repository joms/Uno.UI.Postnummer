using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Net.Http;

namespace Postnummer
{
	public class Data
	{
		public string Result;

		string query;
		string qdata;

		HttpClient httpClient;

		public Data()
		{
			httpClient = new HttpClient();
			query = "http://146.185.162.117/postnummer/all/_search?q=";
			qdata = "{ 'query': { 'match_all': {}} }";
		}

		public void Search(string pnr, Action<string> Callback)
		{
			httpClient.GetStringAsync(query + pnr, Callback);
		}
	}
}