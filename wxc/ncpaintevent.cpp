//-----------------------------------------------------------------------------
// wxD - ncpaintevent.cpp
// (C) 2005 bero <berobero.sourceforge.net>
// based on
// wx.NET - ncpaintevent.cxx
// 
// The wxNcPaintEvent proxy interface.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Id$
//-----------------------------------------------------------------------------

#include <wx/wx.h>
#include "common.h"

//-----------------------------------------------------------------------------

extern "C" WXEXPORT
wxNcPaintEvent* wxNcPaintEvent_ctor(int Id)
{
    return new wxNcPaintEvent(Id);
}
