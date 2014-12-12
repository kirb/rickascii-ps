#define _WIN32_WINNT _WIN32_WINNT_WIN7
#include <windows.h>

int main(int argc, char *argv[]) {
	HWND hwnd = GetConsoleWindow();
	LONG style = GetWindowLong(hwnd, GWL_STYLE);
	SetWindowLongPtr(hwnd, GWL_STYLE, style & ~WS_SYSMENU);
	return 0;
}
