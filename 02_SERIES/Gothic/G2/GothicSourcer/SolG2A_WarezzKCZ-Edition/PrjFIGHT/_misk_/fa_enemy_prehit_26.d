
instance FA_ENEMY_PREHIT_26(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_ENEMY_STORMPREHIT_26(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_MY_W_RUNTO_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_26(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_FOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_FRONTATTACK;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_SIDEATTACK;
};

instance FA_MY_W_NOFOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_26(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_JUMPBACK;
	move[3] = MOVE_SIDEATTACK;
};

instance FA_MY_G_STRAFE_26(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_G_FOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_26(C_FIGHTAI)
{
	move[0] = MOVE_SIDEATTACK;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_26(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
};

instance FA_MY_FK_NOFOCUS_MAG_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

