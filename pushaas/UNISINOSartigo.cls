%=======================================================================
% UNISINOSartigo v0.1
%
% Classe LaTeX elaborada com base nas orientações dadas no documento
% ``GUIA PARA ELABORAÇÃO DE TRABALHOS ACADÊMICOS''
% disponível no site da biblioteca da Unisinos
% (http://www.unisinos.br/biblioteca)
% Comentários abaixo colocados entre aspas (`` '') foram
% extraídos diretamente do documento da biblioteca.
%
% Copyright (C) 2012 Rafael Bohrer Ávila
%
% Trechos deste código foram extraídos/adaptados do pacote 'iiufrgs'
% de classes para documentos do Instituto de Informática da UFRGS,
% mantido pelo grupo UTUG (http://www.inf.ufrgs.br/utug).
% Copyright (C) 2001-2005 UFRGS TeX Users Group
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%=======================================================================

%=======================================================================
% Identificacao
%=======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UNISINOSartigo}[2012/09/05 v0.1 Artigos da UNISINOS]

%=======================================================================
% Declaracoes básicas
%=======================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}
\RequirePackage{babel}
\RequirePackage{times}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\onehalfspacing

%=======================================================================
% Comandos para definições principais.
% Exemplos de uso:
%   \autor{Nome Completo}{Mini-CV}
%=======================================================================
\DeclareRobustCommand{\tituloArtigo}[2]{
	\clearpage
	\noindent%
	\parbox[t]{\textwidth}{%
		\centering%
		\textbf{\MakeUppercase{#1}: #2}%
	}\par
	\vspace{4.5ex}
	\setcounter{page}{1}%
}
\DeclareRobustCommand{\autorArtigo}[1]{%
	{\raggedleft	#1\par}
}

%=======================================================================
% Environment para redação do resumo em Português e no idioma
% estrangeiro.
%
% Exemplos de uso:
%   \begin{abstract}
%     Este trabalho etc etc.
%   \end{abstract}
%
%   \begin{otherlanguage}{english}
%   \begin{abstract}
%     This work etc. etc.
%   \end{abstract}
%   \end{otherlanguage}
%=======================================================================
\renewenvironment{abstract}{%
	\singlespacing%
	\noindent\textbf{\abstractname:}
}{%
	\onehalfspacing%
}
\DeclareRobustCommand{\palavraschave}[1]{%
	\par
	\vspace{2ex}
	\noindent\textbf{\palavraschavename:} #1\par
}

%=======================================================================
% Comando para citações longas.
% Exemplos de uso:
%
% \begin{quote}
%   Ó dia, ó vida, ó azar! (HARDY, 1980)
% \end{quote}
%
% (O exemplo acima não é exatamente "longo"... mas é só um exemplo. :-))
%=======================================================================
\renewenvironment{quote}{%
	\par\addvspace{\baselineskip}%
	\begin{list}{}{
		\setlength{\leftmargin}{40mm}
		\setlength{\parsep}{0em}
		\item\relax
	}
		\small\singlespacing%
}{%
	\end{list}%
	\addvspace{\baselineskip}%
}

%=======================================================================
% Environment para criação de alíneas.
%
% Exemplo de uso:
%   \begin{alineas}
%      \item texto da primeira alínea (inicia sempre em minúsculas);
%      \item texto da segunda alínea;
%      \item texto da última alínea.
%   \end{alineas}
%=======================================================================
\newcounter{alineas}
\newenvironment{alineas}{%
	\begin{list}{\alph{alineas})}{
		\usecounter{alineas}
		\advance\@itemdepth\@ne
	}
}{%
	\end{list}%
}

%=======================================================================
% Comandos para criação de Apêndices e Anexos.
% Exemplos de uso:
%   % isto vai imediatamente após as referências bibliográficas
%   % (ou após o glossário, se este existir)
%   \appendix
%   \section{Informações Complementares} % primeiro apendice
%     Bla bla bla...
%     ...
%
%   \section{Mais Informações} % segundo apendice
%     Bla bla bla...
%     ...
%
%   \annex
%   \section{Artigos Publicados} % primeiro anexo
%     ...
%
% O comando \appendix tem que ser redefinido para mudar a numeração das
% seções para letras e para ativar a centralização dos títulos (ECA).
%
% O comando \annex basicamente chama o comando \appendix passando outro
% nome.
%=======================================================================
\DeclareRobustCommand{\appendix}[1][\appendixname]{%
	\setcounter{section}{0}%
	\renewcommand{\thesection}{\Alph{section}}%
	\gdef\section##1{%
		\stepcounter{section}\clearpage%
		\centerline{\textbf{\MakeUppercase{#1~\thesection~--~##1}}}\par
		\vspace{2ex}
	}
}
\DeclareRobustCommand{\annex}{\appendix[\annexname]}

%=======================================================================
% Comandos/definições para habilitar o uso do unisinos.bst.
%=======================================================================
\DeclareRobustCommand{\unisinosbst}{%
	\usepackage{natbib}
	\bibliographystyle{unisinos}
	\renewenvironment{thebibliography}[1]{%
    	\singlespacing%
    	\singlespacing%
		\centerline{\textbf{\MakeUppercase{\refname}}}\par
		\vspace{2ex}
		\begin{list}{}{
			\renewcommand{\makelabel}[1]{}
			\setlength{\leftmargin}{0em}
			\sloppy\raggedright\singlespacing%
		}
	}{%
		\end{list}
	}
	\setlength{\bibhang}{0pt}
	\setlength{\bibsep}{\baselineskip}
	\let\cite\citep
	\DeclareRobustCommand{\citetexto}[2][]{\citet*[##1]{##2}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIM DOS COMANDOS PARA USUÁRIOS
% As definições abaixo servem somente para colocar o documento dentro
% do formato esperado e não são destinadas a utilização pelo usuário final.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%=======================================================================
% Margens e espacamentos
%=======================================================================
% ajuste das medidas verticais
\setlength{\topmargin}{20mm}
\setlength{\headheight}{2ex}
\setlength{\headsep}{10mm}
	\addtolength{\headsep}{-\headheight}
\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-\topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-20mm}
\setlength{\topskip}{0pt}
\addtolength{\topmargin}{-1in}
\flushbottom

% ajuste das medidas horizontais
\setlength{\oddsidemargin}{30mm}
\setlength{\evensidemargin}{20mm}
\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-\oddsidemargin}
	\addtolength{\textwidth}{-\evensidemargin}
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}

% indentação dos parágrafos
% 1,25 cm fica feio :-(
%\setlength{\parindent}{1.25cm}

%=======================================================================
% Fontes
%=======================================================================
\def\@sectionfont{\normalfont\bfseries}
\def\@subsectionfont{\normalfont\bfseries}
\def\@subsubsectionfont{\normalfont}
\def\@paragraphfont{\normalfont}
\def\@subparagraphfont{\normalfont}
\let\emph\textbf

%=======================================================================
% Cabeçalho e rodapé
%=======================================================================
\def\ps@UNISINOSartigo{
	\def\@oddhead{\hfil\thepage}
	\def\@evenhead{\hfil\thepage}
	\let\@oddfoot\@empty
	\let\@evenfoot\@empty
}
\pagestyle{UNISINOSartigo}

%=======================================================================
% Formatação das seções.
%
% O comando \@sect faz a formatação dos títulos das seções.  Foi necessário
% redefinir esse comando para que as seções primárias ficassem com
% letras maiúsculas... (ECA).
%
% Os demais comandos são redefinidos para acertar o espaçamento antes e
% depois dos títulos.
%=======================================================================
\def\@sect#1#2#3#4#5#6[#7]#8{%
	\refstepcounter{#1}%
	\protected@edef\@svsec{\@seccntformat{#1}\relax}%
	\ifnum #2>1
		\begingroup
			#6{%
				\@hangfrom{\hskip #3\relax\@svsec}%
				\interlinepenalty \@M #8\@@par}%
		\endgroup
	\else
		\begingroup
			#6{%
				\@hangfrom{\hskip #3\relax\@svsec}%
				\interlinepenalty \@M \MakeUppercase{#8}\@@par}%
		\endgroup
	\fi
	\@xsect{#5}%
}

\DeclareRobustCommand{\section}{%
	\@startsection{section}{1}{\z@}{\baselineskip}{\baselineskip}%
		{\@sectionfont}%
}
\DeclareRobustCommand{\subsection}{%
	\@startsection{subsection}{2}{\z@}{\baselineskip}{\baselineskip}%
		{\@subsectionfont}%
}
\DeclareRobustCommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{\z@}{\baselineskip}{\baselineskip}%
		{\@subsubsectionfont}%
}
\DeclareRobustCommand{\paragraph}{%
	\@startsection{paragraph}{4}{\z@}{\baselineskip}{\baselineskip}%
		{\@paragraphfont}%
}
\DeclareRobustCommand{\subparagraph}{%
	\@startsection{subparagraph}{5}{\z@}{\baselineskip}{\baselineskip}%
		{\@subparagraphfont}%
}
\setcounter{secnumdepth}{5}

%=======================================================================
% Comandos para definições principais.
% Exemplos de uso:
%   \autor{Sobrenome}{Nomes Iniciais}
%   \orientador[Prof.~Dr.]{Sobrenome}{Nomes Iniciais}
%   \coorientador[Profa.~Dra.]{Sobrenome}{Nomes Iniciais}
%   \unidade{Unidade Acadêmica de Pesquisa e Pós-Graduação}
%   \natureza{Dissertação apresentada como requisito parcial etc etc...}
%   \local{São Leopoldo} (default)
%   \ano{2012} (default = ano corrente)
%=======================================================================

%\DeclareRobustCommand{\autor}[2]{
%	\gdef\@authorlast{#1}
%	\gdef\@authorfirst{#2}
%}
%\DeclareRobustCommand{\titulo}[1]{
	%\gdef\@title{#1}
%}
\DeclareRobustCommand{\subtitulo}[1]{
	\gdef\@subtitle{#1}
}
\DeclareRobustCommand{\orientador}[3][]{
	\gdef\@advisortitle{#1}
	\gdef\@advisorlast{#2}
	\gdef\@advisorfirst{#3}
}
\DeclareRobustCommand{\unidade}[1]{
	\gdef\@unidade{#1}
}
\DeclareRobustCommand{\curso}[1]{
	\gdef\@curso{#1}
}
\DeclareRobustCommand{\nivel}[1]{
	\gdef\@nivel{#1}
}
\DeclareRobustCommand{\natureza}[1]{
	\gdef\@natureza{#1}
}
\DeclareRobustCommand{\local}[1]{
	\gdef\@local{#1}
}
\DeclareRobustCommand{\ano}[1]{
	\gdef\@ano{#1}
}


%=======================================================================
% Ajuste das legendas das figuras e tabelas.
%
% O comando \@makecaption é o que formata a legenda como ela aparece
% no texto.
%=======================================================================
\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{#1~-- #2}%
	\ifdim \wd\@tempboxa >\hsize
		{#1~-- #2\par}
	\else
		\global \@minipagefalse
		\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
	\fi
	\vskip\belowcaptionskip%
}

\DeclareRobustCommand{\fonte}[1]{%
	\vskip.2\abovecaptionskip%
	\parbox{\textwidth}{\centering\footnotesize\fontename: #1}%
}
\setlength{\abovecaptionskip}{\baselineskip}

\DeclareRobustCommand{\autor}[2]{
	\gdef\@authorlast{#1}
	\gdef\@authorfirst{#2}
}
\DeclareRobustCommand{\titulo}[1]{
	\gdef\@title{#1}
}

%=======================================================================
% Capa
%=======================================================================
\DeclareRobustCommand{\capa}{%
	\clearpage\thispagestyle{empty}%
	\begingroup
		\centering%
		\vbox to 6cm{%
			\textbf{UNIVERSIDADE DO VALE DO RIO DOS SINOS - UNISINOS}\\
			\textbf{\uppercase\expandafter{\@unidade}}\\
			\@ifundefined{@curso}{}{\textbf{\uppercase\expandafter{\@curso}\\}}%
			\@ifundefined{@nivel}{}{\textbf{\uppercase\expandafter{\@nivel}\\}}%
		}
		\vbox to 6cm{%
			\textbf{\MakeUppercase{\@authorfirst~\@authorlast}}\\
			\vfill
			\textbf{\uppercase\expandafter{\@title}}%
			\@ifundefined{@subtitle}%
				{\\}%
				{:\\\textbf{\expandafter{\@subtitle\\}}}%
		}
		\vfill
		\@local\\
		\@ano\par
	\endgroup
}

%=======================================================================
% Folha de rosto
% - de acordo com as orientações da biblioteca, realmente NÃO É para
%   aparecer o nome da instituição no topo
% - ao contrário do que possa parecer lógico, o texto realmente não fica
%   bem centralizado na folha, pelo fato de a margem esquerda ser maior
%   do que a direita :(
%=======================================================================
\DeclareRobustCommand{\folhaderosto}{%
	\clearpage\thispagestyle{empty}%
	\cleardoublepage%
	\vspace*{6cm}
	\begingroup
		\centering%
		\vbox to 6cm{%
			\@authorfirst~\@authorlast\\
			\vfill
			\textbf{\uppercase\expandafter{\@title}}%
			\@ifundefined{@subtitle}{\\}{:\\\textbf{\@subtitle\\}}%
		}
	\endgroup
	\vspace{3cm}
	\begin{flushright}
		\parbox{.5\textwidth}{%
			\raggedright\sloppy%
			\@natureza\\[4ex]
			\orientadorname: \@advisortitle~\@advisorfirst\ \@advisorlast
			\@ifundefined{@coadvisorlast}{}{%
				\\[4ex]
				\coorientadorname: \@coadvisortitle~\@coadvisorfirst\ \@coadvisorlast
			}
		}
	\end{flushright}
	\vfill
	\begingroup
		\centering%
		\@local\\
		\@ano\par
	\endgroup
	\@ifundefined{@ciptipo}{}{\@cip}%
}

%=======================================================================
% Definições dependentes do idioma.
%=======================================================================
\@namedef{captionsenglish}{
	\def\refname{References}
	\def\abstractname{Abstract}
	\def\appendixname{Appendix}
	\def\contentsname{Contents}
	\def\listfigurename{List of Figures}
	\def\listtablename{List of Tables}
	\def\listdefname{List of Definitions}
	\def\listtheoremsname{List of Theorems}
	\def\corollaryname{Corollary}
	\def\propositionname{Proposition}
	\def\definitionname{Definition}
	\def\conjecturename{Conjecture}
	\def\examplename{Example}
	\def\exercisename{Exercise}
	\def\propertyname{Property}
	\def\remarknamek{Remark}
	\def\lemmaname{Lemma}
	\def\theoremname{Theorem}
	\def\proofname{Proof}
	\def\figurename{Figure}
	\def\tablename{Table}
	\def\annexname{Annex}
	\def\palavraschavename{Keywords}
	\def\fontename{Source}
	\def\orientadorname{Adviser}
}
