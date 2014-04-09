function color_scheme(scheme)
% function color_scheme(scheme)
%   Scheme: 'defaults', 'solarized-dark', 'monokai-dark'
%   They are not really those schemes but my approximations
%   IMPORTANT: The 'defaults' scheme doesn't actually restore anything,
%   it just sets values close to the default ones! I don't know how to
%   do it properly and I don't care enough. You might!
%
%   Ripped off from various sources, tweaked to my liking. Thoroughly
%   untested. Use it at your own risk.
%
%   Tried it only with R2013a (os x/linux) and whatever options I use.
%   If something breaks: restore the defaults on the preference pane.
%   If everything breaks: you can delete your preferences file (you'll
%   lose stuff!).
%   Questions: et   ru 1 9   2 7 at gmail dot com

c = input('This action CANNOT BE UNDONE (easily).\nPlease read the help entry (> help color_scheme).\n*Do you wish to proceed?* y/n\n', 's');
if ~isequal(c, 'y')
	fprintf('Ok, no action done\n');
	return;
end

% COMMON
% line numbers 
bool.show_line_numbers = 1;
bool.show_right_hand_line = 0;

switch(scheme)
	%% defaults
	case 'defaults'
		% editor colors
		bool.use_system_colors = 1;
		colors.background = [255 255 255];
		colors.text = [0 0 0];
		colors.keywords = [0 0 255];
		colors.comments = [34 139 34];
		colors.strings = [160 32 240];
		colors.unterminated_strings = [178 34 34];
		colors.system_commands = [205 133 63];
		colors.syntax_errors = [255 0 0];

		% command window colors
		colors.cmd_errors = [255 0 0];
		colors.cmd_warnings = [255 140 0];
		colors.cmd_hyperlinks = [0 0 255];

		% code analyzer colors
		colors.code_analyzer_warnings = [255 165 0];
		bool.autofix_highlight = 0;
		colors.autofix_highlight = [238 232 170];
		bool.automatically_highlight = 0;
		colors.automatically_highlight = [240 255 255];
		bool.variables_shared_scope = 1;
		colors.variables_shared_scope = [0 206 209];
		bool.highlight_cells = 1;
		colors.highlight_cells = [255 255 224];
		bool.show_lines_between_sections = 1;

		% current line color
		bool.current_line = 1;
		colors.current_line = [238 232 170];

	%% solarized light
	%case 'solarized-light'

	%% solarized dark
	case 'solarized-dark'
		% editor colors
		bool.use_system_colors = 0;
		colors.background = [0 43 54];
		colors.text = [151 168 170];
		colors.keywords = [38 139 219];
		colors.comments = [88 110 117];
		colors.strings = [42 161 152];%249 38 114
		colors.unterminated_strings = [211 54 130];
		colors.system_commands = [181 137 0];
		colors.syntax_errors = [220 50 47];

		% command window colors
		colors.cmd_errors = [220 50 47];
		colors.cmd_warnings = [203 75 22];
		colors.cmd_hyperlinks = [38 139 210];

		% code analyzer colors
		colors.code_analyzer_warnings = [203 75 22];
		bool.autofix_highlight = 0;
		%colors.autofix_highlight = [0 0 255];
		bool.automatically_highlight = 1;
		colors.automatically_highlight = [88 110 117];
		bool.variables_shared_scope = 1;
		colors.variables_shared_scope = [133 153 0];
		bool.highlight_cells = 1;
		colors.highlight_cells = [10 53 64];
		bool.show_lines_between_sections = 1;

		% current line color
		bool.current_line = 1;
		colors.current_line = [20 63 74];

	%% monokai
	case 'monokai-dark'
		% editor colors
		bool.use_system_colors = 0;
		%colors.background = [13 13 13];
		colors.background = [31	 32 26];
		colors.text = [248 248 242];
		colors.keywords = [102 217 239];
		colors.comments = [98 99 90];
		colors.strings = [230 219 116];
		colors.unterminated_strings = [253 151 31];
		colors.system_commands = [166 226 46];
		colors.syntax_errors = [249 38 114];

		% command window colors
		colors.cmd_errors = [249 38 114];
		colors.cmd_warnings = [253 151 31];
		colors.cmd_hyperlinks = [102 217 239];

		% code analyzer colors
		colors.code_analyzer_warnings = [253 151 31];
		bool.autofix_highlight = 0;
		%colors.autofix_highlight = [238 232 170];
		bool.automatically_highlight = 1;
		colors.automatically_highlight = [154 109 225];%[166 226 46];
		bool.variables_shared_scope = 1;
		colors.variables_shared_scope = [174 129 255];
		bool.highlight_cells = 1;
		%colors.highlight_cells = [18 18 18];
		colors.highlight_cells = [39 40 34];
		bool.show_lines_between_sections = 1;

		% current line color
		bool.current_line = 1;
		%colors.current_line = [26 26 26];
		colors.current_line = [50 51 45];

	%% nothing
	otherwise
		error('Unknown type');
end

%% apply values
% show line numbers
com.mathworks.services.Prefs.setBooleanPref('EditorShowLineNumbers', bool.show_line_numbers);
% show right-hand line
com.mathworks.services.Prefs.setBooleanPref('EditorRightTextLineVisible',bool.show_right_hand_line);

% system colors
com.mathworks.services.Prefs.setBooleanPref('ColorsUseSystem', bool.use_system_colors);
% text
com.mathworks.services.Prefs.setColorPref('ColorsText', j(colors.text));
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsText');
% background
com.mathworks.services.Prefs.setColorPref('ColorsBackground', j(colors.background));
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsBackground');
% keywords
com.mathworks.services.Prefs.setColorPref('Colors_M_Keywords', j(colors.keywords));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_Keywords');
% comments
com.mathworks.services.Prefs.setColorPref('Colors_M_Comments', j(colors.comments));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_Comments');
% strings
com.mathworks.services.Prefs.setColorPref('Colors_M_Strings', j(colors.strings));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_Strings');
% unterminated strings
com.mathworks.services.Prefs.setColorPref('Colors_M_UnterminatedStrings', j(colors.unterminated_strings));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_UnterminatedStrings');
% system commands
com.mathworks.services.Prefs.setColorPref('Colors_M_SystemCommands', j(colors.system_commands));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_SystemCommands');
% syntax errors
com.mathworks.services.Prefs.setColorPref('Colors_M_Errors', j(colors.syntax_errors));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_Errors');
% command window: errors
com.mathworks.services.Prefs.setColorPref('Color_CmdWinErrors', j(colors.cmd_errors));
com.mathworks.services.ColorPrefs.notifyColorListeners('Color_CmdWinErrors');
% command window: warnings
com.mathworks.services.Prefs.setColorPref('Color_CmdWinWarnings', j(colors.cmd_warnings));
com.mathworks.services.ColorPrefs.notifyColorListeners('Color_CmdWinWarnings');
% command window: hyperlinks
com.mathworks.services.Prefs.setColorPref('Colors_HTML_HTMLLinks', j(colors.cmd_hyperlinks));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_HTML_HTMLLinks');

% code analyzer: warnings
com.mathworks.services.Prefs.setColorPref('Colors_M_Warnings', j(colors.code_analyzer_warnings));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_Warnings');
% code analyzer: autofix highlight
com.mathworks.services.Prefs.setBooleanPref('ColorsUseMLintAutoFixBackground', bool.autofix_highlight);
if bool.autofix_highlight
	com.mathworks.services.Prefs.setColorPref('ColorsMLintAutoFixBackground', j(colors.autofix_highlight));
end
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsMLintAutoFixBackground');
% code analyzer: automatically highlight
com.mathworks.services.Prefs.setBooleanPref('Editor.VariableHighlighting.Automatic', bool.automatically_highlight);
if bool.automatically_highlight
	com.mathworks.services.Prefs.setColorPref('Editor.VariableHighlighting.Color', j(colors.automatically_highlight));
end
com.mathworks.services.ColorPrefs.notifyColorListeners('Editor.VariableHighlighting.Color');
% code analyzer: variables with shared scope
com.mathworks.services.Prefs.setColorPref('Editor.NonlocalVariableHighlighting.TextColor', j(colors.variables_shared_scope));
com.mathworks.services.ColorPrefs.notifyColorListeners('Editor.NonlocalVariableHighlighting.TextColor');
% code analyzer: cell color
com.mathworks.services.Prefs.setBooleanPref('EditorCodepadHighVisible', bool.highlight_cells);
if bool.highlight_cells
	com.mathworks.services.Prefs.setColorPref('Editorhighlight-lines', j(colors.highlight_cells));
end
% code analyzer: show lines between sections
% ...

% highlight current line
com.mathworks.services.Prefs.setBooleanPref('Editorhighlight-caret-row-boolean', bool.current_line);
if bool.current_line
	com.mathworks.services.Prefs.setColorPref('Editorhighlight-caret-row-boolean-color', j(colors.current_line));
end
com.mathworks.services.ColorPrefs.notifyColorListeners('Editorhighlight-caret-row-boolean-color');

fprintf('Done\n');


function cc = j(c)
%% shorthand to format [R, G, B] into a java color thing

if numel(c)~=3
	error('Not an array of 3');
elseif min(c)<0 || max(c)>255
	error('Colors should be [0,255]');
end

cc = java.awt.Color(c(1)/255, c(2)/255, c(3)/255);
