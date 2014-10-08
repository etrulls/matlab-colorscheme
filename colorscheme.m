function colorscheme(scheme, varargin)
% COLORSCHEME Change Matlab's color scheme.
%   colorscheme(SCHEME,[OPTIONS])
%
%   Schemes: 'matlab', 'solarized-dark', 'monokai', 'monokai-dark', 'badwolf'
%
%   Options: 'show-line-numbers', 'hide-line-numbers', 'show-right-hand-line',
%   'hide-right-hand-line', 'show-autofix-highlights',
%   'hide-autofix-highlights', 'show-cell-lines', 'hide-cell-lines'
%
%   Neither are the actual schemes, but (close) adaptations.
%   The 'matlab' scheme does not restore anything. It just sets values close to
%   the defaults.
%
%   This script is thoroughly undebugged: do not take this lightly.
%   You may restore the defaults deleting your .matlab/[RXXX]/matlab.prf file,
%   but you will lose some settings (fonts, etc.)
%
%   Only .m syntax highlighting is altered. Feel free to add support for
%   other filetypes.

% show line numbers
for i=1:numel(varargin)
	if strcmp(varargin{i},'show-line-numbers')
		com.mathworks.services.Prefs.setBooleanPref('EditorShowLineNumbers',1);
	elseif strcmp(varargin{i},'hide-line-numbers')
		com.mathworks.services.Prefs.setBooleanPref('EditorShowLineNumbers',0);
	elseif strcmp(varargin{i},'show-right-hand-line')
		com.mathworks.services.Prefs.setBooleanPref('EditorRightTextLineVisible',1);
	elseif strcmp(varargin{i},'hide-right-hand-line')
		com.mathworks.services.Prefs.setBooleanPref('EditorRightTextLineVisible',0);
	elseif strcmp(varargin{i},'show-autofix-highlight')
		com.mathworks.services.Prefs.setBooleanPref('ColorsUseMLintAutoFixBackground',1);
	elseif strcmp(varargin{i},'hide-autofix-highlight')
		com.mathworks.services.Prefs.setBooleanPref('ColorsUseMLintAutoFixBackground',0);
	elseif strcmp(varargin{i},'show-cell-lines')
		com.mathworks.services.Prefs.setBooleanPref('EditorCodeBlockDividers',1);
	elseif strcmp(varargin{i},'hide-cell-lines')
		com.mathworks.services.Prefs.setBooleanPref('EditorCodeBlockDividers',0);
	end
end

use_system_colors = 0; % overwrites fg/bg with system settings apparently
highlight_autofix_suggestions = 1; % highlights background for things matlab thinks are broken
highlight_current_variable = 1; % hightlights the variable the cursor is on
highlight_current_line = 1;
highlight_cells = 1;

switch(scheme)
	case 'matlab'
		%% similar to defaults (but not the same)
		% editor colors
		colors.background = [255 255 255];
		colors.highlight_cells = [255 255 224];
		colors.highlight_current_line = [238 232 170];
		colors.highlight_autofix_suggestions = [238 232 170];
		colors.highlight_current_variable = [240 255 255];
		
		% underline
		colors.underline_syntax_errors = [255 0 0];
		colors.underline_code_warnings = [255 165 0];
		
		% text
		colors.text = [0 0 0];
		colors.keywords = [0 0 255];
		colors.comments = [34 139 34];
		colors.strings = [160 32 240];
		colors.unterminated_strings = [178 34 34];
		colors.system_commands = [205 133 63];
		colors.persistent_variables = [0 206 209];
		
		% command window colors
		colors.cmd_errors = [255 0 0];
		colors.cmd_warnings = [255 140 0];
		colors.cmd_hyperlinks = [0 0 255];

		% limiter line color
		colors.editor_limiter_line = [200 200 200];

	case 'solarized-dark'
		%% solarized dark
		% background and highlights
		colors.background = [0 43 54];
		colors.highlight_cells = [10 53 64];
		colors.highlight_current_line = [20 63 74];
		colors.highlight_autofix_suggestions = [0 0 255];
		colors.highlight_current_variable = [88 110 117];
		
		% underline
		colors.underline_syntax_errors = [220 50 47];
		colors.underline_code_warnings = [203 75 22];
		
		% text
		colors.text = [151 168 170];
		colors.keywords = [38 139 219];
		colors.comments = [88 110 117];
		colors.strings = [42 161 152];
		colors.unterminated_strings = [211 54 130];
		colors.system_commands = [181 137 0];
		colors.persistent_variables = [133 153 0];

		% command window colors
		colors.cmd_errors = [220 50 47];
		colors.cmd_warnings = [203 75 22];
		colors.cmd_hyperlinks = [38 139 210];
		
		% limiter line color
		colors.editor_limiter_line = [60 60 60];

	case {'monokai','monokai-dark'} % 
		%% monokai
		% background and highlights
		if strcmp(scheme,'monokai')
			colors.background = [36 37 31];
			colors.highlight_cells = [41 42 36];
			colors.highlight_current_line = [49 50 44];
		else
			colors.background = [13 13 13];
			colors.highlight_cells = [23 23 23];
			colors.highlight_current_line = [29 29 29];
		end
		
		colors.highlight_autofix_suggestions = [88 110 117];%[102 217 239]
		colors.highlight_current_variable = [74 39 145];
		
		% underline
		colors.underline_syntax_errors = [249 38 114];
		colors.underline_code_warnings = [253 151 31];
		
		% text
		colors.text = [248 248 242];
		colors.keywords = [249 38 114];%[102 217 239];
		if strcmp(scheme,'monokai')
			colors.comments = [117 113 94];
		else
			colors.comments = [98 99 90];
		end
		colors.strings = [230 219 116];
		colors.unterminated_strings = [253 151 31];
		colors.system_commands = [166 226 46];
		colors.persistent_variables = [166 226 46];

		% command window
		colors.cmd_errors = [249 38 114];
		colors.cmd_warnings = [253 151 31];
		colors.cmd_hyperlinks = [102 217 239];
		
		% limiter line color
		colors.editor_limiter_line = [50 50 50];
	
	case 'badwolf' % http://stevelosh.com/projects/badwolf/
		%% badwolf
		% background and highlights
		colors.background = '141413';
		colors.highlight_cells = '1c1b1a'; % dark: '1c1b1a' light: '242321' mean: '201f1d'
		colors.highlight_current_line = '242321';%'35322d';
		colors.highlight_autofix_suggestions = 'b88853';
		colors.highlight_current_variable = '666462';
		
		% underline
		colors.underline_syntax_errors = 'ff2c4b';
		colors.underline_code_warnings = 'ffa724';
		
		% text
		colors.text = 'f8f6f2';
		colors.keywords = 'ff2c4b';
		colors.comments = '857f78';
		colors.strings = 'f4cf86';
		colors.unterminated_strings = 'ff9eb8';%'ffa724';
		colors.system_commands = '8cffba';
		colors.persistent_variables = 'aeee00';

		% command window
		colors.cmd_errors = 'ff2c4b';
		colors.cmd_warnings = 'ff9eb8';%'ffa724';
		colors.cmd_hyperlinks = '0a9dff';
		
		% limiter line color
		colors.editor_limiter_line = '35322d';

	otherwise
		%% nothing
		error('Unknown type');
end

%% apply values

% system colors (overrides fg/bg)
com.mathworks.services.Prefs.setBooleanPref('ColorsUseSystem', use_system_colors);

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
com.mathworks.services.Prefs.setColorPref('Colors_M_Errors', j(colors.underline_syntax_errors));
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
com.mathworks.services.Prefs.setColorPref('Colors_M_Warnings', j(colors.underline_code_warnings));
com.mathworks.services.ColorPrefs.notifyColorListeners('Colors_M_Warnings');

% code analyzer: autofix highlight
if highlight_autofix_suggestions
	com.mathworks.services.Prefs.setColorPref('ColorsMLintAutoFixBackground', j(colors.highlight_autofix_suggestions));
end
com.mathworks.services.ColorPrefs.notifyColorListeners('ColorsMLintAutoFixBackground');

% code analyzer: automatically highlight
com.mathworks.services.Prefs.setBooleanPref('Editor.VariableHighlighting.Automatic', highlight_current_variable);
if highlight_current_variable
	com.mathworks.services.Prefs.setColorPref('Editor.VariableHighlighting.Color', j(colors.highlight_current_variable));
end
com.mathworks.services.ColorPrefs.notifyColorListeners('Editor.VariableHighlighting.Color');

% code analyzer: variables with shared scope
com.mathworks.services.Prefs.setColorPref('Editor.NonlocalVariableHighlighting.TextColor', j(colors.persistent_variables));
com.mathworks.services.ColorPrefs.notifyColorListeners('Editor.NonlocalVariableHighlighting.TextColor');

% code analyzer: cell color
com.mathworks.services.Prefs.setBooleanPref('EditorCodepadHighVisible', highlight_cells);
if highlight_cells
	com.mathworks.services.Prefs.setColorPref('Editorhighlight-lines', j(colors.highlight_cells));
end

% highlight current line
com.mathworks.services.Prefs.setBooleanPref('Editorhighlight-caret-row-boolean', highlight_current_line);
if highlight_current_line
	com.mathworks.services.Prefs.setColorPref('Editorhighlight-caret-row-boolean-color', j(colors.highlight_current_line));
end
com.mathworks.services.ColorPrefs.notifyColorListeners('Editorhighlight-caret-row-boolean-color');

% right-hand side line
com.mathworks.services.Prefs.setColorPref('EditorRightTextLimitLineColor', j(colors.editor_limiter_line));


function cc = j(c)
%% shorthand to format [R, G, B] into a java color thing

switch class(c)
	case {'single','double'}
		if numel(c)~=3
			error('Not an array of 3');
		elseif min(c)<0 || max(c)>255
			error('Colors should be [0,255]');
		end
		r = c(1)/255;
		g = c(2)/255;
		b = c(3)/255;
	
	case 'char'
		if numel(c)~=6
			error('Bad color format');
		end
		r = hex2dec(c(1:2))/255;
		g = hex2dec(c(3:4))/255;
		b = hex2dec(c(5:6))/255;
	
	otherwise
		error('Bad color format');
end

cc = java.awt.Color(r,g,b);
