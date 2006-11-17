//-----------------------------------------------------------------------------
// wxD/Samples - Hello.d
// converted to wxD from http://www.wxwidgets.org/wiki/index.php/Hello_World
//-----------------------------------------------------------------------------

import wx.wx;

 /**
  * This class shows a window containing a statusbar with the text 'Hello World'
  */
public class HelloWorldApp : App
{
	public override bool OnInit()
	{
        Frame frame = new Frame(null, wxID_ANY, "Hello wxWidgets World");
        frame.CreateStatusBar();
        frame.SetStatusText("Hello World");
        frame.Show(true);
        //SetTopWindow(frame);
        return true;
	}
}

int main()
{
	HelloWorldApp app = new HelloWorldApp();
	app.Run();
	return 0;
}
