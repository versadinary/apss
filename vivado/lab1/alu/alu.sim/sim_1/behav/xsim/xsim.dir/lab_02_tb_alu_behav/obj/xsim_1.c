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
extern void execute_5(char*, char *);
extern void execute_50(char*, char *);
extern void execute_71(char*, char *);
extern void svlog_sampling_process_execute(char*, char*, char*);
extern void sequence_expr_m_936afbc3_5c6ca80d_1(char*, char *);
extern void sequence_expr_m_936afbc3_5c6ca80d_2(char*, char *);
extern void vlog_sv_sequence_execute_0 (char*, char*, char*);
extern void assertion_action_m_936afbc3_5c6ca80d_1(char*, char *);
extern void execute_278(char*, char *);
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_281(char*, char *);
extern void execute_282(char*, char *);
extern void execute_283(char*, char *);
extern void execute_284(char*, char *);
extern void execute_285(char*, char *);
extern void execute_286(char*, char *);
extern void execute_287(char*, char *);
extern void execute_48(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_116(char*, char *);
extern void execute_205(char*, char *);
extern void execute_206(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_209(char*, char *);
extern void execute_210(char*, char *);
extern void execute_211(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_127(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_213(char*, char *);
extern void execute_214(char*, char *);
extern void execute_215(char*, char *);
extern void execute_216(char*, char *);
extern void execute_217(char*, char *);
extern void execute_218(char*, char *);
extern void execute_219(char*, char *);
extern void execute_220(char*, char *);
extern void execute_221(char*, char *);
extern void execute_222(char*, char *);
extern void execute_223(char*, char *);
extern void execute_224(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_227(char*, char *);
extern void execute_228(char*, char *);
extern void execute_229(char*, char *);
extern void execute_230(char*, char *);
extern void execute_231(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_235(char*, char *);
extern void execute_236(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_244(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void execute_248(char*, char *);
extern void execute_249(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_252(char*, char *);
extern void execute_253(char*, char *);
extern void execute_254(char*, char *);
extern void execute_255(char*, char *);
extern void execute_256(char*, char *);
extern void execute_257(char*, char *);
extern void execute_258(char*, char *);
extern void execute_259(char*, char *);
extern void execute_260(char*, char *);
extern void execute_261(char*, char *);
extern void execute_262(char*, char *);
extern void execute_263(char*, char *);
extern void execute_264(char*, char *);
extern void execute_265(char*, char *);
extern void execute_266(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_288(char*, char *);
extern void execute_289(char*, char *);
extern void execute_290(char*, char *);
extern void execute_291(char*, char *);
extern void execute_292(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback_2state(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[104] = {(funcp)execute_5, (funcp)execute_50, (funcp)execute_71, (funcp)svlog_sampling_process_execute, (funcp)sequence_expr_m_936afbc3_5c6ca80d_1, (funcp)sequence_expr_m_936afbc3_5c6ca80d_2, (funcp)vlog_sv_sequence_execute_0 , (funcp)assertion_action_m_936afbc3_5c6ca80d_1, (funcp)execute_278, (funcp)execute_279, (funcp)execute_280, (funcp)execute_281, (funcp)execute_282, (funcp)execute_283, (funcp)execute_284, (funcp)execute_285, (funcp)execute_286, (funcp)execute_287, (funcp)execute_48, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_116, (funcp)execute_205, (funcp)execute_206, (funcp)execute_207, (funcp)execute_208, (funcp)execute_209, (funcp)execute_210, (funcp)execute_211, (funcp)execute_125, (funcp)execute_126, (funcp)execute_127, (funcp)execute_117, (funcp)execute_118, (funcp)execute_213, (funcp)execute_214, (funcp)execute_215, (funcp)execute_216, (funcp)execute_217, (funcp)execute_218, (funcp)execute_219, (funcp)execute_220, (funcp)execute_221, (funcp)execute_222, (funcp)execute_223, (funcp)execute_224, (funcp)execute_225, (funcp)execute_226, (funcp)execute_227, (funcp)execute_228, (funcp)execute_229, (funcp)execute_230, (funcp)execute_231, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_235, (funcp)execute_236, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_240, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_249, (funcp)execute_250, (funcp)execute_251, (funcp)execute_252, (funcp)execute_253, (funcp)execute_254, (funcp)execute_255, (funcp)execute_256, (funcp)execute_257, (funcp)execute_258, (funcp)execute_259, (funcp)execute_260, (funcp)execute_261, (funcp)execute_262, (funcp)execute_263, (funcp)execute_264, (funcp)execute_265, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_288, (funcp)execute_289, (funcp)execute_290, (funcp)execute_291, (funcp)execute_292, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_2, (funcp)vlog_transfunc_eventcallback_2state};
const int NumRelocateId= 104;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/lab_02_tb_alu_behav/xsim.reloc",  (void **)funcTab, 104);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/lab_02_tb_alu_behav/xsim.reloc");
}

void simulate(char *dp)
{
iki_register_root_pointers(8, 38416, 12,0,37576, 10,0,38584, 13,0,37240, 9,0,37912, 11,0,36904, 8,0,35896, 6,0,36064, 7,0) ; 
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/lab_02_tb_alu_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void subprog_m_936afbc3_5c6ca80d_12() ;
void subprog_m_936afbc3_5c6ca80d_11() ;
void subprog_m_936afbc3_5c6ca80d_10() ;
void subprog_m_936afbc3_5c6ca80d_17() ;
void subprog_m_936afbc3_5c6ca80d_16() ;
void subprog_m_936afbc3_5c6ca80d_15() ;
void subprog_m_936afbc3_5c6ca80d_22() ;
void subprog_m_936afbc3_5c6ca80d_21() ;
void subprog_m_936afbc3_5c6ca80d_20() ;
void subprog_m_936afbc3_5c6ca80d_27() ;
void subprog_m_936afbc3_5c6ca80d_26() ;
void subprog_m_936afbc3_5c6ca80d_25() ;
void subprog_m_936afbc3_5c6ca80d_32() ;
void subprog_m_936afbc3_5c6ca80d_31() ;
void subprog_m_936afbc3_5c6ca80d_30() ;
void subprog_m_936afbc3_5c6ca80d_37() ;
void subprog_m_936afbc3_5c6ca80d_36() ;
void subprog_m_936afbc3_5c6ca80d_35() ;
void subprog_m_936afbc3_5c6ca80d_42() ;
void subprog_m_936afbc3_5c6ca80d_41() ;
void subprog_m_936afbc3_5c6ca80d_40() ;
void subprog_m_936afbc3_5c6ca80d_47() ;
void subprog_m_936afbc3_5c6ca80d_46() ;
void subprog_m_936afbc3_5c6ca80d_45() ;
static char* ng60[] = {(void *)subprog_m_936afbc3_5c6ca80d_12, (void *)subprog_m_936afbc3_5c6ca80d_11, (void *)subprog_m_936afbc3_5c6ca80d_10};
static char* ng70[] = {(void *)subprog_m_936afbc3_5c6ca80d_17, (void *)subprog_m_936afbc3_5c6ca80d_16, (void *)subprog_m_936afbc3_5c6ca80d_15};
static char* ng80[] = {(void *)subprog_m_936afbc3_5c6ca80d_22, (void *)subprog_m_936afbc3_5c6ca80d_21, (void *)subprog_m_936afbc3_5c6ca80d_20};
static char* ng90[] = {(void *)subprog_m_936afbc3_5c6ca80d_27, (void *)subprog_m_936afbc3_5c6ca80d_26, (void *)subprog_m_936afbc3_5c6ca80d_25};
static char* ng100[] = {(void *)subprog_m_936afbc3_5c6ca80d_32, (void *)subprog_m_936afbc3_5c6ca80d_31, (void *)subprog_m_936afbc3_5c6ca80d_30};
static char* ng110[] = {(void *)subprog_m_936afbc3_5c6ca80d_37, (void *)subprog_m_936afbc3_5c6ca80d_36, (void *)subprog_m_936afbc3_5c6ca80d_35};
static char* ng120[] = {(void *)subprog_m_936afbc3_5c6ca80d_42, (void *)subprog_m_936afbc3_5c6ca80d_41, (void *)subprog_m_936afbc3_5c6ca80d_40};
static char* ng130[] = {(void *)subprog_m_936afbc3_5c6ca80d_47, (void *)subprog_m_936afbc3_5c6ca80d_46, (void *)subprog_m_936afbc3_5c6ca80d_45};
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
    iki_set_sv_type_file_path_name("xsim.dir/lab_02_tb_alu_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/lab_02_tb_alu_behav/xsim.crvsdump");
    iki_svlog_initialize_virtual_tables(8, 6, ng60, 7, ng70, 8, ng80, 9, ng90, 10, ng100, 11, ng110, 12, ng120, 13, ng130);
    void* design_handle = iki_create_design("xsim.dir/lab_02_tb_alu_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
