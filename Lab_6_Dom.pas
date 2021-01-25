program Symulator_Lotto;
 
	const zakres = 49;
		ilosc = 6;
		gracze = 5;
	var lotto : Array[1..53, 1..ilosc] of Integer;
		typowane : Array[1..ilosc] of Integer;
		tab : Array[1..zakres] of Integer;
		tab_temp : Array[1..zakres] of Integer;
 
		i, j, k, g, l, m, liczba, count, max_ilosc, max_liczba, ile_13 : Integer;
		traf_1, traf_2, traf_3, traf_4, traf_5, traf_6 : Integer;
		byla : boolean;
	type tbaza = record
		los_liczby : Array[1..6] of Integer;
		end;
	var rec_tab : Array[1..53] of tbaza;
 
	function inkrementacja(inc : integer) : Integer;
		begin
			inkrementacja := inc + 1;
		end;
 
begin
	randomize();
 
	for i:=1 to zakres do tab[i] := i;
 
	(*Wypełnienie kuponu dla wszystkich graczy*)
	typowane[1] := 2;
	typowane[2] := 5;
	typowane[3] := 18;
	typowane[4] := 29;
	typowane[5] := 33;
	typowane[6] := 45;
 
for g:=1 to gracze do
	begin
 
	for i:=1 to zakres do tab_temp[i] := 0;
	for i:=1 to zakres do tab[i] := i;
	ile_13 := 0;
 
	(*Zerowanie początkowe zmiennych zliczających ilość trafień dla poszczególnych graczy*)
	count := 0;
	traf_1 := 0;
	traf_2 := 0;
	traf_3 := 0;
	traf_4 := 0;
	traf_5 := 0;
	traf_6 := 0;
 
	writeln('Gracz ', g, '. :');
	for i:=1 to 53 do
		begin
			write(i, '.: ');
			for j:=1 to ilosc do
				begin
					(*Wypełnienie tablicy pseudolosowymi liczbami*)
					byla := true;
					while byla do
						begin
							liczba := random(zakres) + 1;
							byla := false;
							for k:=1 to j-1 do
								begin
									if lotto[i][k] = liczba then byla := true;
								end;
						end;
					lotto[i][j] := liczba;
					write(lotto[i][j], ' ');
 
					count := 0;
 
 
 
					(*Wprowadzenie do wyzerowanej tabeli ilosci trafien poszczegolnych liczb*)	
					for l:=1 to zakres do
						begin
							if lotto[i][j] = tab[l] then
								begin
								tab_temp[l] := tab_temp[l] + 1;
								end;
					end;
 
				(*Liczenie ile razy wypadla liczba 13*)
				rec_tab[i].los_liczby[j] := lotto[i][j];
				if rec_tab[i].los_liczby[j] = 13 then ile_13 := ile_13 + 1;
 
				end;
 
							(*Zliczanie trafien liczb*)
 
							for m:=1 to ilosc do
								begin
									if typowane[m] = lotto[i][m] then count := count+1;
								end;
 
							(*Zliczanie do zmiennych trafien wygranych*)	
							if count = 1 then traf_1 := inkrementacja(traf_1);
							if count = 2 then traf_2 := inkrementacja(traf_2);
							if count = 3 then traf_3 := inkrementacja(traf_3);
							if count = 4 then traf_4 := inkrementacja(traf_4);
							if count = 5 then traf_5 := inkrementacja(traf_5);
							if count = 6 then traf_6 := inkrementacja(traf_6);
 
			writeln;
		end;
 
	(*Znajdowanie najczesciej trafianej liczby oraz ilosci jej trafien dla jednej osoby w okresie roku*)
	max_ilosc := tab_temp[1];
	for i:=1 to zakres do
		begin
			if tab_temp[i+1] > max_ilosc then
				begin
					max_ilosc := tab_temp[i+1];
				end;
		end;
	for i:= 1 to zakres do
		begin
			if tab_temp[i] = max_ilosc then max_liczba := i;
		end;
 
	(*Wypisywanie poszczególnych trafień*)
	writeln('Trafien - 1: ', traf_1);
	writeln('Trafien - 2: ', traf_2);
	writeln('Trafien - 3: ', traf_3);
	writeln('Trafien - 4: ', traf_4);
	writeln('Trafien - 5: ', traf_5);
	writeln('Trafien - 6: ', traf_6);
	writeln('Najczestsza liczba: ', max_liczba, ' | Wypadla: ', max_ilosc, ' razy')	;
	writeln('Trzynastka trafiona ', ile_13, ' razy w losowaniach: ');
 
	(*Wypisywanie w jakich losowaniach wypadła liczba 13*)
	for i:=1 to 53 do
		begin
			for j:=1 to ilosc do
				begin
					if lotto[i][j] = 13 then
						begin
							write(i, '., ');
						end;
				end;
		end;
 
	writeln('');
	writeln('');
	end;	
	
end.