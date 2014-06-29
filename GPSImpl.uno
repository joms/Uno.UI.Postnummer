using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

using Uno.Compiler.ExportTargetInterop;

namespace Postnummer
{
	[TargetSpecificType]
	class GPSHandle
	{	
	}
	
	[TargetSpecificImplementation]
	static class GPSImpl
	{
		[TargetSpecificImplementation]
		public static GPSHandle Create(string foo) { return null; }
		
		[TargetSpecificImplementation]
		public static GetFoo(GPSHandle gps) { return null; }
	}
	
	public class GPS
	{
		GPSHandle _gps;
		
		public GPS(string foo) { _gps = GPSImpl.Create(foo); }
		public string Foo() { return GPSImpl.GetFoo(_gps); }
	}
}