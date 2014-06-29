using Uno.Compiler.ExportTargetInterop;

[TargetSpecificType]
class GPSHandle
{
}

[TargetSpecificImplementation]
static class GPSImpl
{
	[TargetSpecificImplementation]
	public static GPSHandle Create(string url) { return null; }

	[TargetSpecificImplementation]
	public static string GetURL(GPSHandle gps) { return null; }
}

public class GPS
{
	GPSHandle _gps;

	public GPS(string url) { _gps = GPSImpl.Create(url); }
	public string URL() { return GPSImpl.GetURL(_gps); }
}