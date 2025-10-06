/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_7(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_131(char*, char *);
extern void execute_215(char*, char *);
extern void execute_216(char*, char *);
extern void execute_217(char*, char *);
extern void execute_218(char*, char *);
extern void execute_219(char*, char *);
extern void execute_220(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_for_reg(char*, char*, char*);
extern void execute_224(char*, char *);
extern void execute_226(char*, char *);
extern void svlog_sampling_process_execute(char*, char*, char*);
extern void sequence_expr_m_eb9189f7_68c8e2c4_1(char*, char *);
extern void vlog_sv_sequence_execute_0 (char*, char*, char*);
extern void assertion_action_m_eb9189f7_68c8e2c4_1(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_3(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_4(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_2(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_2(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_6(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_7(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_3(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_5(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_9(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_10(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_4(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_8(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_12(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_13(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_5(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_11(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_14(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_15(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_6(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_16(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_17(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_7(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_18(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_19(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_8(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_21(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_22(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_9(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_20(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_23(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_24(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_10(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_26(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_27(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_11(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_25(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_28(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_29(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_12(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_30(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_31(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_13(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_32(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_33(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_14(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_34(char*, char *);
extern void sequence_expr_m_eb9189f7_68c8e2c4_35(char*, char *);
extern void assertion_action_m_eb9189f7_68c8e2c4_15(char*, char *);
extern void execute_296(char*, char *);
extern void execute_297(char*, char *);
extern void execute_41(char*, char *);
extern void execute_136(char*, char *);
extern void execute_137(char*, char *);
extern void execute_138(char*, char *);
extern void execute_55(char*, char *);
extern void execute_139(char*, char *);
extern void execute_140(char*, char *);
extern void execute_141(char*, char *);
extern void execute_142(char*, char *);
extern void execute_143(char*, char *);
extern void execute_144(char*, char *);
extern void execute_145(char*, char *);
extern void execute_146(char*, char *);
extern void execute_147(char*, char *);
extern void execute_148(char*, char *);
extern void execute_149(char*, char *);
extern void execute_150(char*, char *);
extern void execute_151(char*, char *);
extern void execute_152(char*, char *);
extern void execute_153(char*, char *);
extern void execute_154(char*, char *);
extern void execute_155(char*, char *);
extern void execute_156(char*, char *);
extern void execute_157(char*, char *);
extern void execute_158(char*, char *);
extern void execute_159(char*, char *);
extern void execute_160(char*, char *);
extern void execute_161(char*, char *);
extern void execute_162(char*, char *);
extern void execute_163(char*, char *);
extern void execute_164(char*, char *);
extern void execute_165(char*, char *);
extern void execute_166(char*, char *);
extern void execute_167(char*, char *);
extern void execute_168(char*, char *);
extern void execute_169(char*, char *);
extern void execute_170(char*, char *);
extern void execute_171(char*, char *);
extern void execute_172(char*, char *);
extern void execute_173(char*, char *);
extern void execute_174(char*, char *);
extern void execute_175(char*, char *);
extern void execute_176(char*, char *);
extern void execute_177(char*, char *);
extern void execute_178(char*, char *);
extern void execute_179(char*, char *);
extern void execute_180(char*, char *);
extern void execute_181(char*, char *);
extern void execute_182(char*, char *);
extern void execute_183(char*, char *);
extern void execute_184(char*, char *);
extern void execute_185(char*, char *);
extern void execute_186(char*, char *);
extern void execute_187(char*, char *);
extern void execute_188(char*, char *);
extern void execute_189(char*, char *);
extern void execute_190(char*, char *);
extern void execute_191(char*, char *);
extern void execute_192(char*, char *);
extern void execute_193(char*, char *);
extern void execute_194(char*, char *);
extern void execute_195(char*, char *);
extern void execute_196(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_199(char*, char *);
extern void execute_200(char*, char *);
extern void execute_201(char*, char *);
extern void execute_202(char*, char *);
extern void execute_203(char*, char *);
extern void execute_204(char*, char *);
extern void execute_205(char*, char *);
extern void execute_206(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_209(char*, char *);
extern void execute_210(char*, char *);
extern void execute_211(char*, char *);
extern void execute_212(char*, char *);
extern void execute_213(char*, char *);
extern void execute_214(char*, char *);
extern void execute_44(char*, char *);
extern void execute_46(char*, char *);
extern void execute_48(char*, char *);
extern void execute_50(char*, char *);
extern void execute_52(char*, char *);
extern void execute_54(char*, char *);
extern void execute_133(char*, char *);
extern void execute_134(char*, char *);
extern void execute_135(char*, char *);
extern void execute_298(char*, char *);
extern void execute_299(char*, char *);
extern void execute_300(char*, char *);
extern void execute_301(char*, char *);
extern void execute_302(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback_2state(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[168] = {(funcp)execute_7, (funcp)execute_37, (funcp)execute_38, (funcp)execute_39, (funcp)execute_56, (funcp)execute_57, (funcp)execute_131, (funcp)execute_215, (funcp)execute_216, (funcp)execute_217, (funcp)execute_218, (funcp)execute_219, (funcp)execute_220, (funcp)vlog_const_rhs_process_execute_0_fast_for_reg, (funcp)execute_224, (funcp)execute_226, (funcp)svlog_sampling_process_execute, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_1, (funcp)vlog_sv_sequence_execute_0 , (funcp)assertion_action_m_eb9189f7_68c8e2c4_1, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_3, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_4, (funcp)assertion_action_m_eb9189f7_68c8e2c4_2, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_2, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_6, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_7, (funcp)assertion_action_m_eb9189f7_68c8e2c4_3, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_5, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_9, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_10, (funcp)assertion_action_m_eb9189f7_68c8e2c4_4, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_8, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_12, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_13, (funcp)assertion_action_m_eb9189f7_68c8e2c4_5, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_11, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_14, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_15, (funcp)assertion_action_m_eb9189f7_68c8e2c4_6, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_16, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_17, (funcp)assertion_action_m_eb9189f7_68c8e2c4_7, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_18, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_19, (funcp)assertion_action_m_eb9189f7_68c8e2c4_8, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_21, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_22, (funcp)assertion_action_m_eb9189f7_68c8e2c4_9, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_20, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_23, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_24, (funcp)assertion_action_m_eb9189f7_68c8e2c4_10, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_26, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_27, (funcp)assertion_action_m_eb9189f7_68c8e2c4_11, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_25, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_28, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_29, (funcp)assertion_action_m_eb9189f7_68c8e2c4_12, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_30, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_31, (funcp)assertion_action_m_eb9189f7_68c8e2c4_13, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_32, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_33, (funcp)assertion_action_m_eb9189f7_68c8e2c4_14, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_34, (funcp)sequence_expr_m_eb9189f7_68c8e2c4_35, (funcp)assertion_action_m_eb9189f7_68c8e2c4_15, (funcp)execute_296, (funcp)execute_297, (funcp)execute_41, (funcp)execute_136, (funcp)execute_137, (funcp)execute_138, (funcp)execute_55, (funcp)execute_139, (funcp)execute_140, (funcp)execute_141, (funcp)execute_142, (funcp)execute_143, (funcp)execute_144, (funcp)execute_145, (funcp)execute_146, (funcp)execute_147, (funcp)execute_148, (funcp)execute_149, (funcp)execute_150, (funcp)execute_151, (funcp)execute_152, (funcp)execute_153, (funcp)execute_154, (funcp)execute_155, (funcp)execute_156, (funcp)execute_157, (funcp)execute_158, (funcp)execute_159, (funcp)execute_160, (funcp)execute_161, (funcp)execute_162, (funcp)execute_163, (funcp)execute_164, (funcp)execute_165, (funcp)execute_166, (funcp)execute_167, (funcp)execute_168, (funcp)execute_169, (funcp)execute_170, (funcp)execute_171, (funcp)execute_172, (funcp)execute_173, (funcp)execute_174, (funcp)execute_175, (funcp)execute_176, (funcp)execute_177, (funcp)execute_178, (funcp)execute_179, (funcp)execute_180, (funcp)execute_181, (funcp)execute_182, (funcp)execute_183, (funcp)execute_184, (funcp)execute_185, (funcp)execute_186, (funcp)execute_187, (funcp)execute_188, (funcp)execute_189, (funcp)execute_190, (funcp)execute_191, (funcp)execute_192, (funcp)execute_193, (funcp)execute_194, (funcp)execute_195, (funcp)execute_196, (funcp)execute_197, (funcp)execute_198, (funcp)execute_199, (funcp)execute_200, (funcp)execute_201, (funcp)execute_202, (funcp)execute_203, (funcp)execute_204, (funcp)execute_205, (funcp)execute_206, (funcp)execute_207, (funcp)execute_208, (funcp)execute_209, (funcp)execute_210, (funcp)execute_211, (funcp)execute_212, (funcp)execute_213, (funcp)execute_214, (funcp)execute_44, (funcp)execute_46, (funcp)execute_48, (funcp)execute_50, (funcp)execute_52, (funcp)execute_54, (funcp)execute_133, (funcp)execute_134, (funcp)execute_135, (funcp)execute_298, (funcp)execute_299, (funcp)execute_300, (funcp)execute_301, (funcp)execute_302, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_3, (funcp)vlog_transfunc_eventcallback_2state};
const int NumRelocateId= 168;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/lab_05_tb_decoder_behav/xsim.reloc",  (void **)funcTab, 168);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/lab_05_tb_decoder_behav/xsim.reloc");
}

void simulate(char *dp)
{
iki_register_root_pointers(17, 15320, -5,0,15488, -5,0,17336, 10,0,16160, 9,0,15824, 8,0,5592, 3,0,19352, 19,0,18176, 12,0,18344, 13,0,19016, 17,0,19688, 21,0,18680, 15,0,18008, 11,0,19520, 20,0,18512, 14,0,19184, 18,0,18848, 16,0) ; 
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/lab_05_tb_decoder_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void subprog_m_eb9189f7_68c8e2c4_24() ;
void subprog_m_eb9189f7_68c8e2c4_23() ;
void subprog_m_eb9189f7_68c8e2c4_22() ;
void subprog_m_eb9189f7_68c8e2c4_21() ;
void subprog_m_eb9189f7_68c8e2c4_20() ;
void subprog_m_eb9189f7_68c8e2c4_19() ;
void subprog_m_eb9189f7_68c8e2c4_18() ;
void subprog_m_eb9189f7_68c8e2c4_17() ;
void subprog_m_eb9189f7_68c8e2c4_16() ;
void subprog_m_eb9189f7_68c8e2c4_15() ;
void subprog_m_eb9189f7_68c8e2c4_14() ;
void subprog_m_eb9189f7_68c8e2c4_13() ;
void subprog_m_eb9189f7_68c8e2c4_12() ;
void subprog_m_eb9189f7_68c8e2c4_11() ;
void subprog_m_eb9189f7_68c8e2c4_29() ;
void subprog_m_eb9189f7_68c8e2c4_28() ;
void subprog_m_eb9189f7_68c8e2c4_27() ;
void subprog_m_eb9189f7_68c8e2c4_33() ;
void subprog_m_eb9189f7_68c8e2c4_32() ;
void subprog_m_eb9189f7_68c8e2c4_31() ;
void subprog_m_eb9189f7_68c8e2c4_38() ;
void subprog_m_eb9189f7_68c8e2c4_37() ;
void subprog_m_eb9189f7_68c8e2c4_36() ;
void subprog_m_eb9189f7_68c8e2c4_41() ;
void subprog_m_eb9189f7_68c8e2c4_74() ;
void subprog_m_eb9189f7_68c8e2c4_77() ;
void subprog_m_eb9189f7_68c8e2c4_80() ;
void subprog_m_eb9189f7_68c8e2c4_83() ;
void subprog_m_eb9189f7_68c8e2c4_46() ;
void subprog_m_eb9189f7_68c8e2c4_45() ;
void subprog_m_eb9189f7_68c8e2c4_44() ;
void subprog_m_eb9189f7_68c8e2c4_51() ;
void subprog_m_eb9189f7_68c8e2c4_50() ;
void subprog_m_eb9189f7_68c8e2c4_49() ;
void subprog_m_eb9189f7_68c8e2c4_56() ;
void subprog_m_eb9189f7_68c8e2c4_55() ;
void subprog_m_eb9189f7_68c8e2c4_54() ;
void subprog_m_eb9189f7_68c8e2c4_61() ;
void subprog_m_eb9189f7_68c8e2c4_60() ;
void subprog_m_eb9189f7_68c8e2c4_59() ;
void subprog_m_eb9189f7_68c8e2c4_66() ;
void subprog_m_eb9189f7_68c8e2c4_65() ;
void subprog_m_eb9189f7_68c8e2c4_64() ;
void subprog_m_eb9189f7_68c8e2c4_71() ;
void subprog_m_eb9189f7_68c8e2c4_70() ;
void subprog_m_eb9189f7_68c8e2c4_69() ;
static char* ng30[] = {(void *)subprog_m_eb9189f7_68c8e2c4_24, (void *)subprog_m_eb9189f7_68c8e2c4_23, (void *)subprog_m_eb9189f7_68c8e2c4_22, (void *)subprog_m_eb9189f7_68c8e2c4_21, (void *)subprog_m_eb9189f7_68c8e2c4_20, (void *)subprog_m_eb9189f7_68c8e2c4_19, (void *)subprog_m_eb9189f7_68c8e2c4_18, (void *)subprog_m_eb9189f7_68c8e2c4_17, (void *)subprog_m_eb9189f7_68c8e2c4_16, (void *)subprog_m_eb9189f7_68c8e2c4_15, (void *)subprog_m_eb9189f7_68c8e2c4_14, (void *)subprog_m_eb9189f7_68c8e2c4_13, (void *)subprog_m_eb9189f7_68c8e2c4_12, (void *)subprog_m_eb9189f7_68c8e2c4_11};
static char* ng80[] = {(void *)subprog_m_eb9189f7_68c8e2c4_29, (void *)subprog_m_eb9189f7_68c8e2c4_28, (void *)subprog_m_eb9189f7_68c8e2c4_27};
static char* ng90[] = {(void *)subprog_m_eb9189f7_68c8e2c4_33, (void *)subprog_m_eb9189f7_68c8e2c4_32, (void *)subprog_m_eb9189f7_68c8e2c4_31};
static char* ng100[] = {(void *)subprog_m_eb9189f7_68c8e2c4_38, (void *)subprog_m_eb9189f7_68c8e2c4_37, (void *)subprog_m_eb9189f7_68c8e2c4_36};
static char* ng110[] = {(void *)subprog_m_eb9189f7_68c8e2c4_41};
static char* ng120[] = {(void *)subprog_m_eb9189f7_68c8e2c4_74};
static char* ng130[] = {(void *)subprog_m_eb9189f7_68c8e2c4_77};
static char* ng140[] = {(void *)subprog_m_eb9189f7_68c8e2c4_80};
static char* ng150[] = {(void *)subprog_m_eb9189f7_68c8e2c4_83};
static char* ng160[] = {(void *)subprog_m_eb9189f7_68c8e2c4_46, (void *)subprog_m_eb9189f7_68c8e2c4_45, (void *)subprog_m_eb9189f7_68c8e2c4_44};
static char* ng170[] = {(void *)subprog_m_eb9189f7_68c8e2c4_51, (void *)subprog_m_eb9189f7_68c8e2c4_50, (void *)subprog_m_eb9189f7_68c8e2c4_49};
static char* ng180[] = {(void *)subprog_m_eb9189f7_68c8e2c4_56, (void *)subprog_m_eb9189f7_68c8e2c4_55, (void *)subprog_m_eb9189f7_68c8e2c4_54};
static char* ng190[] = {(void *)subprog_m_eb9189f7_68c8e2c4_61, (void *)subprog_m_eb9189f7_68c8e2c4_60, (void *)subprog_m_eb9189f7_68c8e2c4_59};
static char* ng200[] = {(void *)subprog_m_eb9189f7_68c8e2c4_66, (void *)subprog_m_eb9189f7_68c8e2c4_65, (void *)subprog_m_eb9189f7_68c8e2c4_64};
static char* ng210[] = {(void *)subprog_m_eb9189f7_68c8e2c4_71, (void *)subprog_m_eb9189f7_68c8e2c4_70, (void *)subprog_m_eb9189f7_68c8e2c4_69};
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/lab_05_tb_decoder_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/lab_05_tb_decoder_behav/xsim.crvsdump");
    iki_svlog_initialize_virtual_tables(15, 3, ng30, 8, ng80, 9, ng90, 10, ng100, 11, ng110, 12, ng120, 13, ng130, 14, ng140, 15, ng150, 16, ng160, 17, ng170, 18, ng180, 19, ng190, 20, ng200, 21, ng210);
    void* design_handle = iki_create_design("xsim.dir/lab_05_tb_decoder_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
