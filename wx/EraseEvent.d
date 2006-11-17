//-----------------------------------------------------------------------------
// wxD - EraseEvent.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - EraseEvent.cs
//
// The wxEraseEvent wrapper class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id$
//-----------------------------------------------------------------------------

module wx.EraseEvent;
import wx.common;

import wx.Event;
import wx.DC;

		//! \cond EXTERN
		static extern (C) IntPtr wxEraseEvent_ctor(int id, IntPtr dc);
		static extern (C) IntPtr wxEraseEvent_GetDC(IntPtr self);
		//! \endcond
		
		//-----------------------------------------------------------------------------

	public class EraseEvent : Event
	{
		public this(IntPtr wxobj) 
			{ super(wxobj); }

		public this(int id=0, DC dc = null)
			{ this(wxEraseEvent_ctor(id,wxObject.SafePtr(dc))); }

		//-----------------------------------------------------------------------------	
		
		public DC GetDC() { return cast(DC)FindObject(wxEraseEvent_GetDC(wxobj), &DC.New); }

		private static Event New(IntPtr obj) { return new EraseEvent(obj); }

		static this()
		{
			AddEventType(wxEVT_ERASE_BACKGROUND,			&EraseEvent.New);
		}
	}
