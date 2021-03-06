LIBTARGET = ../libwxd.a

OBJECTS = \
	Accelerator.o  \
	ActivateEvent.o  \
	App.o  \
	ArtProvider.o  \
	Bitmap.o  \
	BitmapButton.o  \
	BoxSizer.o  \
	Brush.o  \
	Button.o  \
	CalendarCtrl.o  \
	Caret.o  \
	CheckBox.o  \
	ChildFocusEvent.o  \
	Choice.o  \
	ChoiceDialog.o  \
	ClientData.o  \
	Clipboard.o  \
	CloseEvent.o  \
	Colour.o  \
	ColourDialog.o  \
	ComboBox.o  \
	CommandEvent.o  \
	Config.o  \
	ContextMenuEvent.o  \
	Control.o  \
	Cursor.o  \
	DC.o  \
	DND.o  \
	DataFormat.o  \
	DataObject.o  \
	Defs.o  \
	Dialog.o  \
	DirDialog.o  \
	Display.o  \
	DisplayChangedEvent.o  \
	Document.o  \
	EraseEvent.o  \
	Event.o  \
	EvtHandler.o  \
	FileDialog.o  \
	FindReplaceDialog.o  \
	FlexGridSizer.o  \
	FocusEvent.o  \
	Font.o  \
	FontDialog.o  \
	FontMisc.o  \
	Frame.o  \
	GDIObject.o  \
	GLCanvas.o  \
	Gauge.o  \
	GdiCommon.o  \
	GridBagSizer.o  \
	GridSizer.o  \
	HelpEvent.o  \
	HTML.o  \
	HtmlHelpController.o  \
	HtmlListBox.o  \
	IControlWithItems.o  \
	Icon.o  \
	IconizeEvent.o  \
	IdleEvent.o  \
	Image.o  \
	ImageList.o  \
	ImageHandlers.o  \
	InitDialogEvent.o  \
	KeyEvent.o  \
	LayoutWin.o  \
	ListBox.o  \
	ListCtrl.o  \
	Listbook.o  \
	Locale.o  \
	Log.o  \
	MDI.o  \
	MaximizeEvent.o  \
	MemoryDC.o  \
	Menu.o  \
	MenuBar.o  \
	MenuItem.o  \
	MessageDialog.o  \
	MiniFrame.o  \
	MouseCaptureChangedEvent.o  \
	MouseEvent.o  \
	MoveEvent.o  \
	NavigationKeyEvent.o  \
	NcPaintEvent.o  \
	Notebook.o  \
	NotebookSizer.o  \
	PaintEvent.o  \
	Palette.o  \
	PaletteChangedEvent.o  \
	Panel.o  \
	Pen.o  \
	PrintData.o  \
	PrintDialog.o  \
	PrintPreview.o  \
	Printer.o  \
	ProgressDialog.o  \
	QueryNewPaletteEvent.o  \
	RadioBox.o  \
	RadioButton.o  \
	Region.o  \
	SashWindow.o  \
	ScrollBar.o  \
	ScrolledWindow.o  \
	SetCursorEvent.o  \
	ShowEvent.o  \
	SizeEvent.o  \
	Sizer.o  \
	SizerItem.o  \
	Slider.o  \
	Sound.o  \
	SpinButton.o  \
	SpinCtrl.o  \
	SplashScreen.o  \
	SplitterWindow.o  \
	StaticBitmap.o  \
	StaticBox.o  \
	StaticBoxSizer.o  \
	StaticLine.o  \
	StaticText.o  \
	StatusBar.o  \
	StyledTextCtrl.o  \
	SysColourChangedEvent.o  \
	SystemSettings.o  \
	TabCtrl.o  \
	TaskBarIcon.o \
	TextCtrl.o  \
	TextDialog.o  \
	Thread.o  \
	Timer.o  \
	TipDialog.o  \
	TipWindow.o  \
	ToggleButton.o  \
	ToolBar.o  \
	ToolTip.o  \
	TreeCtrl.o  \
	UpdateUIEvent.o  \
	Utils.o  \
	VLBox.o  \
	VScroll.o  \
	Validator.o  \
	VideoMode.o  \
	View.o  \
	Window.o  \
	WindowCreateEvent.o  \
	WindowDestroyEvent.o  \
	Wizard.o  \
	WizardPage.o  \
	WizardPageSimple.o  \
	wxDateTime.o  \
	wxObject.o  \
	wxString.o  \
	wxVersion.o  \
	wxPlatform.o  \
	Grid.o  \
	GridCtrl.o  \
	common.o  \
	ArrayInt.o  \
	ArrayString.o  \
	XmlResource.o  \
	NumberDialog.o \
	aui/FrameManager.o \
	aui/DockArt.o \
	aui/aui.o \
	wx.o

#	DbGrid.o  \

SOURCES = $(shell ls *.d aui/*.d | grep -v DbGrid.d)

all:  D_VERSION $(LIBTARGET)

COMPILER ?= DMD
LIBRARY ?= Phobos

# FreeBSD uses this
PREFIX ?= /usr/local

ifeq ("$(COMPILER)","DMD")
DC?=dmd
DMD?=dmd
DFLAGS?=-O -g
version=-version
output=-of$@
endif
ifeq ("$(COMPILER)","LDC")
DC?=ldc
DMD?=ldmd
DFLAGS?=-O
version=$(shell $(DC) | grep 0.9 >/dev/null && echo "-version" || echo "-d-version")
output=-of$@
endif
ifeq ("$(COMPILER)","GDC")
DC?=gdc
DMD?=gdmd
DFLAGS?=-O2 -g
version=-fversion
output=-o $@
endif

OS=$(shell uname)

ifeq ("$(OS)","FreeBSD")
ifeq ("$(COMPILER)","GDC")
DFLAGS += -fno-strict-aliasing
endif
endif

ifeq ("$(LIBRARY)","Tango")
DFLAGS += $(version)=Tango
ifeq ("$(COMPILER)","GDC")
ifneq ("$(OS)","MINGW32_NT-5.1")
DFLAGS += $(version)=Posix
endif
endif
endif

ifeq ("$(COMPILER)","DMD")
# typedef deprecated: http://d.puremagic.com/issues/show_bug.cgi?id=6572
DFLAGS += -d
endif

ifeq ("$(STC)","1")
STCFLAGS = $(version)=WXD_STYLEDTEXTCTRL
endif

prefix=$(PREFIX)
exec_prefix=$(prefix)
includedir=$(prefix)/include
libdir=$(exec_prefix)/lib

INSTALL = install
RANLIB = ranlib

INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = ${INSTALL} -m 644

install: $(LIBTARGET)
	$(INSTALL) -d $(DESTDIR)$(libdir)
	$(INSTALL_DATA) -p $(LIBTARGET) $(DESTDIR)$(libdir)
	$(INSTALL) -d $(DESTDIR)$(includedir)/d/wx
	$(INSTALL_DATA) -p *.d $(DESTDIR)$(includedir)/d/wx
	$(INSTALL) -d $(DESTDIR)$(includedir)/d/wx/aui
	$(INSTALL_DATA) -p aui/*.d $(DESTDIR)$(includedir)/d/wx/aui
	$(INSTALL) -d $(DESTDIR)$(includedir)/d/wx/ogl
	$(INSTALL_DATA) -p ogl/*.d $(DESTDIR)$(includedir)/d/wx/ogl
	-$(RANLIB) $(DESTDIR)$(libdir)/`basename $(LIBTARGET)`

ddoc:
	$(DMD) -c -o- -D -I.. $(SOURCES)

ifeq ("$(COMPILER) $(OS)","DMD Darwin")
$(LIBTARGET): $(OBJECTS)
	$(DMD) -lib -of$@ $^
else
$(LIBTARGET): $(OBJECTS)
	ar rcs $@ $^
endif

ifdef ENCODING
VERSION=$(version)=wx$(WX_RELEASE_NODOT) $(version)=__$(PLATFORM)__ $(version)=$(ENCODING)
endif

D_VERSION: d-version$(EXEEXT)
	./d-version > $@

%.o:%.d
	$(DC) $(VERSION) $(STCFLAGS) -I.. $(DFLAGS) -c $(output) $<

d-version$(EXEEXT): version.o
	$(DC) $(DFLAGS) $(LDFLAGS) $(output) $<

clean:
	-rm *.o aui/*.o ogl/*.o
	-rm *.html aui/*.html ogl/*.html
	-rm d-version$(EXEEXT)
	-rm $(LIBTARGET)

