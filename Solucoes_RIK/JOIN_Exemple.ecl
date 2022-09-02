outrec := RECORD
    myrec;
    string email;
END;
//
outrec Mytransf2 myrec Le, myrec2 Ri) := TRANSFORM
  SELF := Le;
  SELF := Ri;
END;
//
joinedrecs := JOIN (rolledrecs, LEFT.owner = RIGHT.owner, Mytransf2(LEFT,RIGHT));