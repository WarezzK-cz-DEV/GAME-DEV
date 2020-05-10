
instance FA_ENEMY_PREHIT_16(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_ATTACK;
};

instance FA_ENEMY_STORMPREHIT_16(C_FIGHTAI)
{
	move[1] = MOVE_ATTACK;
};

instance FA_MY_W_COMBO_16(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_16(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_W_STRAFE_16(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_16(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_MASTERATTACK;
	move[3] = MOVE_TRIPLEATTACK;
	move[4] = MOVE_STRAFE;
	move[5] = MOVE_SIDEATTACK;
	move[6] = MOVE_PARADE;
};

instance FA_MY_W_NOFOCUS_16(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_16(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_16(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_16(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_16(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_16(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_16(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_16(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_16(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_16(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_16(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

