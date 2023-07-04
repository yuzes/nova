#include "Application.h"

#include "Nova/Events/ApplicationEvent.h"
#include "Nova/Log.h"

namespace Nova {
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{	
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			NV_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput)) {
			NV_TRACE(e);
		}
		while (true);
	}
}