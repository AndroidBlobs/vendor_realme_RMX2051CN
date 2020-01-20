#! /vendor/bin/sh

# Copyright (c) 2009-2016, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
# Add for debug on user build or aging test build

############################function defined part start#########################################
enable_aging_ftrace()
{
    echo 0 > /d/tracing/tracing_on
    echo 100000 > /d/tracing/buffer_size_kb
    echo "" > /d/tracing/set_event
    echo "" > /d/tracing/trace 

    echo 0 > /d/tracing/events/enable
    #echo 1 > /d/tracing/events/sched/sched_blocked_reason/enable
    #echo 1 > /d/tracing/events/sched/sched_enq_deq_task/enable
    #echo 1 > /d/tracing/events/sched/sched_find_best_target/enable
    echo 1 > /d/tracing/events/sched/sched_isolate/enable
    #echo 1 > /d/tracing/events/sched/sched_migrate_task/enable
    #echo 1 > /d/tracing/events/sched/sched_preempt_disable/enable
    #echo 1 > /d/tracing/events/sched/sched_set_preferred_cluster/enable
    #echo 1 > /d/tracing/events/sched/sched_stat_blocked/enable
    #echo 1 > /d/tracing/events/sched/sched_stat_iowait/enable
    echo 1 > /d/tracing/events/sched/sched_wakeup/enable
    #echo 1 > /d/tracing/events/sched/sched_waking/enable

    #echo 1 > /d/tracing/events/sched/sched_task_util/enable
    #echo 1 > /d/tracing/events/sched/sched_update_task_ravg_mini/enable
    #echo 1 > /d/tracing/events/sched/sched_util_est_cpu/enable
    #echo 1 > /d/tracing/events/sched/sched_util_est_task/enable
    #echo 1 > /d/tracing/events/sched/sched_load_to_gov/enable
    #echo 1 > /d/tracing/events/sched/sched_cpu_util/enable
    #echo 1 > /d/tracing/events/power/sugov_next_freq/enable
    #echo 1 > /d/tracing/events/power/sugov_util_update/enable
#    echo 1 > /d/tracing/events/power/cpu_frequency/enable
#    echo 1 > /d/tracing/events/power/cpu_frequency_limits/enable

#debug the irq storm problem
    #echo 1 > /d/tracing/events/irq/enable
    #echo 1 > /d/tracing/events/irq/filter
    echo 1 > /d/tracing/events/irq/softirq_entry/enable
    echo 1 > /d/tracing/events/irq/softirq_exit/enable
    #echo 1 > /d/tracing/events/irq/softirq_raise/enable

#debug the io related problem
    #echo 1 > /d/tracing/events/block/block_rq_issue
    #echo 1 > /d/tracing/events/block/block_rq_complete
    #echo 1 > /d/tracing/events/block/enable
    #echo 1 > /d/tracing/events/ufs/enable
    #echo 1 > /d/tracing/events/scsi/enable

#debug f2fs related problem
   # echo 1 > /d/tracing/events/f2fs/f2fs_destroy_extent_tree/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_drop_inode f2fs_evict_inode/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_fallocate/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_iget/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_iget_exit/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_map_blocks/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_new_inode/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_blocks_enter/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_blocks_exit/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_inode_blocks_enter/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_inode_blocks_exit/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_node/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_nodes_enter/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_truncate_nodes_exit/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_unlink_enter/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_unlink_exit/enable
   # echo 1 > /d/tracing/events/f2fs/f2fs_write_checkpoint/enable

    echo 1 > /d/tracing/tracing_on
}


config_lito_dcc_ddr()
{
    #DDR -DCC starts here.
    #Start Link list #6
    #LLCC
    echo 0x9220480 1 > $DCC_PATH/config
    echo 0x9232100 1 > $DCC_PATH/config
    echo 0x92360b0 1 > $DCC_PATH/config
    echo 0x9236044 4 > $DCC_PATH/config
    echo 0x923e030 1 > $DCC_PATH/config
    echo 0x9241000 1 > $DCC_PATH/config
    echo 0x9248048 4 > $DCC_PATH/config
    echo 0x9248058 4 > $DCC_PATH/config

    #CABO
    echo 0x9260400 > $DCC_PATH/config
    echo 0x9260410 > $DCC_PATH/config
    echo 0x9260414 > $DCC_PATH/config
    echo 0x9260418 > $DCC_PATH/config
    echo 0x9260420 > $DCC_PATH/config
    echo 0x9260424 > $DCC_PATH/config
    echo 0x9260430 > $DCC_PATH/config
    echo 0x9260440 > $DCC_PATH/config
    echo 0x9260448 > $DCC_PATH/config
    echo 0x92604a0 > $DCC_PATH/config
    echo 0x92604B8 > $DCC_PATH/config
    echo 0x9265804 > $DCC_PATH/config
    echo 0x9266418 > $DCC_PATH/config
    echo 0x92E0400 > $DCC_PATH/config
    echo 0x92e0410 > $DCC_PATH/config
    echo 0x92e0414 > $DCC_PATH/config
    echo 0x92e0418 > $DCC_PATH/config
    echo 0x92e0420 > $DCC_PATH/config
    echo 0x92e0424 > $DCC_PATH/config
    echo 0x92e0430 > $DCC_PATH/config
    echo 0x92e0440 > $DCC_PATH/config
    echo 0x92e0448 > $DCC_PATH/config
    echo 0x92e04a0 > $DCC_PATH/config
    echo 0x92E04B8 > $DCC_PATH/config
    echo 0x92E5804 > $DCC_PATH/config
    echo 0x92E6418 > $DCC_PATH/config

    #LLCC Broadcast
    echo 0x9600000 > $DCC_PATH/config
    echo 0x9600004 > $DCC_PATH/config
    echo 0x9601000 > $DCC_PATH/config
    echo 0x9601004 > $DCC_PATH/config
    echo 0x9602000 > $DCC_PATH/config
    echo 0x9602004 > $DCC_PATH/config
    echo 0x9603000 > $DCC_PATH/config
    echo 0x9603004 > $DCC_PATH/config
    echo 0x9604000 > $DCC_PATH/config
    echo 0x9604004 > $DCC_PATH/config
    echo 0x9605000 > $DCC_PATH/config
    echo 0x9605004 > $DCC_PATH/config
    echo 0x9606000 > $DCC_PATH/config
    echo 0x9606004 > $DCC_PATH/config
    echo 0x9607000 > $DCC_PATH/config
    echo 0x9607004 > $DCC_PATH/config
    echo 0x9608000 > $DCC_PATH/config
    echo 0x9608004 > $DCC_PATH/config
    echo 0x9609000 > $DCC_PATH/config
    echo 0x9609004 > $DCC_PATH/config
    echo 0x960a000 > $DCC_PATH/config
    echo 0x960a004 > $DCC_PATH/config
    echo 0x960b000 > $DCC_PATH/config
    echo 0x960b004 > $DCC_PATH/config
    echo 0x960c000 > $DCC_PATH/config
    echo 0x960c004 > $DCC_PATH/config
    echo 0x960d000 > $DCC_PATH/config
    echo 0x960d004 > $DCC_PATH/config
    echo 0x960e000 > $DCC_PATH/config
    echo 0x960e004 > $DCC_PATH/config
    echo 0x960f000 > $DCC_PATH/config
    echo 0x960f004 > $DCC_PATH/config
    echo 0x9610000 > $DCC_PATH/config
    echo 0x9610004 > $DCC_PATH/config
    echo 0x9611000 > $DCC_PATH/config
    echo 0x9611004 > $DCC_PATH/config
    echo 0x9612000 > $DCC_PATH/config
    echo 0x9612004 > $DCC_PATH/config
    echo 0x9613000 > $DCC_PATH/config
    echo 0x9613004 > $DCC_PATH/config
    echo 0x9614000 > $DCC_PATH/config
    echo 0x9614004 > $DCC_PATH/config
    echo 0x9615000 > $DCC_PATH/config
    echo 0x9615004 > $DCC_PATH/config
    echo 0x9616000 > $DCC_PATH/config
    echo 0x9616004 > $DCC_PATH/config
    echo 0x9617000 > $DCC_PATH/config
    echo 0x9617004 > $DCC_PATH/config
    echo 0x9618000 > $DCC_PATH/config
    echo 0x9618004 > $DCC_PATH/config
    echo 0x9619000 > $DCC_PATH/config
    echo 0x9619004 > $DCC_PATH/config
    echo 0x961a000 > $DCC_PATH/config
    echo 0x961a004 > $DCC_PATH/config
    echo 0x961b000 > $DCC_PATH/config
    echo 0x961b004 > $DCC_PATH/config
    echo 0x961c000 > $DCC_PATH/config
    echo 0x961c004 > $DCC_PATH/config
    echo 0x961d000 > $DCC_PATH/config
    echo 0x961d004 > $DCC_PATH/config
    echo 0x961e000 > $DCC_PATH/config
    echo 0x961e004 > $DCC_PATH/config
    echo 0x961f000 > $DCC_PATH/config
    echo 0x961f004 > $DCC_PATH/config

    #SHRM / MCCC
    echo 0x9050008 > $DCC_PATH/config
    echo 0x9050068 > $DCC_PATH/config
    echo 0x9050078 > $DCC_PATH/config
    echo 0x90b0280 > $DCC_PATH/config
    echo 0x90b0288 > $DCC_PATH/config
    echo 0x90b028c > $DCC_PATH/config
    echo 0x90b0290 > $DCC_PATH/config
    echo 0x90b0294 > $DCC_PATH/config
    echo 0x90b0298 > $DCC_PATH/config
    echo 0x90b029c > $DCC_PATH/config
    echo 0x90b02a0 > $DCC_PATH/config

    echo 0x090C012C > $DCC_PATH/config
    echo 0x090C8040 > $DCC_PATH/config
    #LLCC1
    echo 0x92a0480 > $DCC_PATH/config
    echo 0x92b2100 > $DCC_PATH/config
    echo 0x92b6044 > $DCC_PATH/config
    echo 0x92b6048 > $DCC_PATH/config
    echo 0x92b604c > $DCC_PATH/config
    echo 0x92b6050 > $DCC_PATH/config
    echo 0x92b60b0 > $DCC_PATH/config
    echo 0x92be030 > $DCC_PATH/config
    echo 0x92c1000 > $DCC_PATH/config
    echo 0x92C8048 4 > $DCC_PATH/config
    echo 0x92c8058 > $DCC_PATH/config
    echo 0x92c805c > $DCC_PATH/config
    echo 0x92c8060 > $DCC_PATH/config
    echo 0x92c8064 > $DCC_PATH/config
   #End Link list #6
}

config_lito_dcc_cam()
{
    #Cam CC
    echo 0x10B008 > $DCC_PATH/config
    echo 0xAD0C1C4 > $DCC_PATH/config
    echo 0xAD0C12C > $DCC_PATH/config
    echo 0xAD0C130 > $DCC_PATH/config
    echo 0xAD0C144 > $DCC_PATH/config
    echo 0xAD0C148 > $DCC_PATH/config
}

config_lito_dcc_gemnoc()
{
    #GemNOC for lito start
    echo 0x9680000 3 > $DCC_PATH/config
    echo 8 > $DCC_PATH/loop
    echo 0x9681000 > $DCC_PATH/config
    echo 1 > $DCC_PATH/loop
    echo 0x09680078 > $DCC_PATH/config
    echo 0x9681008 12> $DCC_PATH/config
    echo 0xA6 > $DCC_PATH/loop
    echo 0x9681008 > $DCC_PATH/config
    echo 0x968100C > $DCC_PATH/config
    echo 1 > $DCC_PATH/loop
    echo 0x968103C > $DCC_PATH/config
    echo 0x9698100 > $DCC_PATH/config
    echo 0x9698104 > $DCC_PATH/config
    echo 0x9698108 > $DCC_PATH/config
    echo 0x9698110 > $DCC_PATH/config
    echo 0x9698120 > $DCC_PATH/config
    echo 0x9698124 > $DCC_PATH/config
    echo 0x9698128 > $DCC_PATH/config
    echo 0x969812c > $DCC_PATH/config
    echo 0x9698130 > $DCC_PATH/config
    echo 0x9698134 > $DCC_PATH/config
    echo 0x9698138 > $DCC_PATH/config
    echo 0x969813c > $DCC_PATH/config
    #GemNOC for lito end
}

config_lito_dcc_gpu()
{
    #GCC
    echo 0x171004 > $DCC_PATH/config
    echo 0x171154 > $DCC_PATH/config
    echo 0x17100C > $DCC_PATH/config
    echo 0x171018 > $DCC_PATH/config

    #GPUCC
    echo 0x3D9106C > $DCC_PATH/config
    echo 0x3D9100C > $DCC_PATH/config
    echo 0x3D91010 > $DCC_PATH/config
    echo 0x3D91014 > $DCC_PATH/config
    echo 0x3D91070 > $DCC_PATH/config
    echo 0x3D91074 > $DCC_PATH/config
    echo 0x3D91098 > $DCC_PATH/config
    echo 0x3D91004 > $DCC_PATH/config
    echo 0x3D9109C > $DCC_PATH/config
    echo 0x3D91078 > $DCC_PATH/config
    echo 0x3D91054 > $DCC_PATH/config
}

config_lito_dcc_lpm()
{
    #PCU Register
    echo 0x18000024 > $DCC_PATH/config
    echo 0x18000040 > $DCC_PATH/config
    echo 0x18010024 > $DCC_PATH/config
    echo 0x18010040 > $DCC_PATH/config
    echo 0x18020024 > $DCC_PATH/config
    echo 0x18020040 > $DCC_PATH/config
    echo 0x18030024 > $DCC_PATH/config
    echo 0x18030040 > $DCC_PATH/config
    echo 0x18040024 > $DCC_PATH/config
    echo 0x18040040 > $DCC_PATH/config
    echo 0x18050024 > $DCC_PATH/config
    echo 0x18050040 > $DCC_PATH/config
    echo 0x18060024 > $DCC_PATH/config
    echo 0x18060040 > $DCC_PATH/config
    echo 0x18070024 > $DCC_PATH/config
    echo 0x18070040 > $DCC_PATH/config
    echo 0x18080024 > $DCC_PATH/config
    echo 0x18080040 > $DCC_PATH/config
    echo 0x18080044 > $DCC_PATH/config
    echo 0x18080048 > $DCC_PATH/config
    echo 0x1808004c > $DCC_PATH/config
    echo 0x18080054 > $DCC_PATH/config
    echo 0x1808006c > $DCC_PATH/config
    echo 0x18080070 > $DCC_PATH/config
    echo 0x18080074 > $DCC_PATH/config
    echo 0x18080078 > $DCC_PATH/config
    echo 0x1808007c > $DCC_PATH/config
    echo 0x180800f4 > $DCC_PATH/config
    echo 0x180800f8 > $DCC_PATH/config
    echo 0x18080104 > $DCC_PATH/config
    echo 0x18080118 > $DCC_PATH/config
    echo 0x1808011c > $DCC_PATH/config
    echo 0x18080128 > $DCC_PATH/config
    echo 0x1808012c > $DCC_PATH/config
    echo 0x18080130 > $DCC_PATH/config
    echo 0x18080134 > $DCC_PATH/config
    echo 0x18080138 > $DCC_PATH/config
    echo 0x18080158 > $DCC_PATH/config
    echo 0x1808015c > $DCC_PATH/config
    echo 0x18080168 > $DCC_PATH/config
    echo 0x18080170 > $DCC_PATH/config
    echo 0x18080174 > $DCC_PATH/config
    echo 0x18080188 > $DCC_PATH/config
    echo 0x1808018c > $DCC_PATH/config
    echo 0x18080198 > $DCC_PATH/config
    echo 0x180801ac > $DCC_PATH/config
    echo 0x180801b0 > $DCC_PATH/config
    echo 0x180801b4 > $DCC_PATH/config
    echo 0x180801b8 > $DCC_PATH/config
    echo 0x180801bc > $DCC_PATH/config
    echo 0x180801f0 > $DCC_PATH/config
    echo 0x18280000 > $DCC_PATH/config
    echo 0x18282000 > $DCC_PATH/config
    echo 0x18284000 > $DCC_PATH/config
    echo 0x18286000 > $DCC_PATH/config
}

config_lito_dcc_osm()
{
    #APSS_OSM_RAIN0/RAIL1
    echo 0x1832102c > $DCC_PATH/config
    echo 0x18321044 > $DCC_PATH/config
    echo 0x18321700 > $DCC_PATH/config
    echo 0x18321710 > $DCC_PATH/config
    echo 0x1832176c > $DCC_PATH/config
    echo 0x18321818 > $DCC_PATH/config
    echo 0x18321920 > $DCC_PATH/config
    echo 0x18322c18 > $DCC_PATH/config
    echo 0x1832302c > $DCC_PATH/config
    echo 0x18323044 > $DCC_PATH/config
    echo 0x18323700 > $DCC_PATH/config
    echo 0x18323710 > $DCC_PATH/config
    echo 0x1832376c > $DCC_PATH/config
    echo 0x18323818 > $DCC_PATH/config
    echo 0x18323920 > $DCC_PATH/config
    echo 0x18324c18 > $DCC_PATH/config
    echo 0x1832582c > $DCC_PATH/config
    echo 0x18325844 > $DCC_PATH/config
    echo 0x18325f00 > $DCC_PATH/config
    echo 0x18325f10 > $DCC_PATH/config
    echo 0x18325f6c > $DCC_PATH/config
    echo 0x18326018 > $DCC_PATH/config
    echo 0x18326120 > $DCC_PATH/config
    echo 0x18327418 > $DCC_PATH/config
    echo 0x1832782c > $DCC_PATH/config
    echo 0x18327844 > $DCC_PATH/config
    echo 0x18327f00 > $DCC_PATH/config
    echo 0x18327f10 > $DCC_PATH/config
    echo 0x18327f6c > $DCC_PATH/config
    echo 0x18328018 > $DCC_PATH/config
    echo 0x18328120 > $DCC_PATH/config
    echo 0x18329418 > $DCC_PATH/config
}

config_lito_dcc_core()
{
    # core hang
    echo 0x1800005C 1 > $DCC_PATH/config
    echo 0x1801005C 1 > $DCC_PATH/config
    echo 0x1802005C 1 > $DCC_PATH/config
    echo 0x1803005C 1 > $DCC_PATH/config
    echo 0x1804005C 1 > $DCC_PATH/config
    echo 0x1805005C 1 > $DCC_PATH/config
    echo 0x1806005C 1 > $DCC_PATH/config
    echo 0x1807005C 1 > $DCC_PATH/config
    echo 0x17C0003C 1 > $DCC_PATH/config

    #CPRh
    echo 0x18101908 1 > $DCC_PATH/config
    echo 0x18101C18 1 > $DCC_PATH/config
    echo 0x18390810 1 > $DCC_PATH/config
    echo 0x18390C50 1 > $DCC_PATH/config
    echo 0x18390814 1 > $DCC_PATH/config
    echo 0x18390C54 1 > $DCC_PATH/config
    echo 0x18390818 1 > $DCC_PATH/config
    echo 0x18390C58 1 > $DCC_PATH/config
    echo 0x18393A84 2 > $DCC_PATH/config
    echo 0x18100908 1 > $DCC_PATH/config
    echo 0x18100C18 1 > $DCC_PATH/config
    echo 0x183A0810 1 > $DCC_PATH/config
    echo 0x183A0C50 1 > $DCC_PATH/config
    echo 0x183A0814 1 > $DCC_PATH/config
    echo 0x183A0C54 1 > $DCC_PATH/config
    echo 0x183A0818 1 > $DCC_PATH/config
    echo 0x183A0C58 1 > $DCC_PATH/config
    echo 0x183A3A84 2 > $DCC_PATH/config
    echo 0x18393500 1 > $DCC_PATH/config
    echo 0x18393580 1 > $DCC_PATH/config
    echo 0x183A3500 1 > $DCC_PATH/config
    echo 0x183A3580 1 > $DCC_PATH/config

    #Silver / L3 / Gold+ PLL
    echo 0x18280000 4 > $DCC_PATH/config
    echo 0x18284000 4 > $DCC_PATH/config
    echo 0x18286000 4 > $DCC_PATH/config

    #Gold PLL
    echo 0x18282000 4 > $DCC_PATH/config
    echo 0x18282028 1 > $DCC_PATH/config
    echo 0x18282038 1 > $DCC_PATH/config
    echo 0x18282080 5 > $DCC_PATH/config
    echo 0x18286000 4 > $DCC_PATH/config
    echo 0x18286028 1 > $DCC_PATH/config
    echo 0x18286038 1 > $DCC_PATH/config
    echo 0x18286080 5 > $DCC_PATH/config
    #rpmh
    echo 0x0C201244 1 > $DCC_PATH/config
    echo 0x0C202244 1 > $DCC_PATH/config
    echo 0x18300000 1 > $DCC_PATH/config

    #GOLD
    echo 0x1829208C 1 > $DCC_PATH/config
    echo 0x1829209C 0x78 > $DCC_PATH/config_write
    echo 0x1829209C 0x0  > $DCC_PATH/config_write
    echo 0x18292048 0x1  > $DCC_PATH/config_write
    echo 0x18292090 0x0  > $DCC_PATH/config_write
    echo 0x18292090 0x25 > $DCC_PATH/config_write
    echo 0x18292098 1 > $DCC_PATH/config
    echo 0x18292048 0x1D > $DCC_PATH/config_write
    echo 0x18292090 0x0  > $DCC_PATH/config_write
    echo 0x18292090 0x25 > $DCC_PATH/config_write
    echo 0x18292098 1 > $DCC_PATH/config

    #GOLD+
    echo 0x1829608C 1 > $DCC_PATH/config
    echo 0x1829609C 0x78 > $DCC_PATH/config_write
    echo 0x1829609C 0x0  > $DCC_PATH/config_write
    echo 0x18296048 0x1  > $DCC_PATH/config_write
    echo 0x18296090 0x0  > $DCC_PATH/config_write
    echo 0x18296090 0x25 > $DCC_PATH/config_write
    echo 0x18296098 1 > $DCC_PATH/config
    echo 0x18296048 0x1D > $DCC_PATH/config_write
    echo 0x18296090 0x0  > $DCC_PATH/config_write
    echo 0x18296090 0x25 > $DCC_PATH/config_write
}

config_lito_dcc_noc(){
    echo 0x0010500C > $DCC_PATH/config
    echo 0x00104144 > $DCC_PATH/config
    echo 0x00105034 > $DCC_PATH/config
     
    #Enable clocks for SNOC sense registers
    echo 0x0010500C 0x1 > $DCC_PATH/config_write
    echo 0x00104144 0x1 > $DCC_PATH/config_write
    echo 0x00105034 0x1 > $DCC_PATH/config_write
     
    echo 0x0010500C > $DCC_PATH/config
    echo 0x00104144 > $DCC_PATH/config
    echo 0x00105034 > $DCC_PATH/config
    #A1NOC
    echo 0x16e0000 > $DCC_PATH/config
    echo 0x16e0004 > $DCC_PATH/config
    echo 0x16e0288 > $DCC_PATH/config
    echo 0x16e0290 > $DCC_PATH/config
    echo 0x16e0300 > $DCC_PATH/config
    echo 0x16e0408 > $DCC_PATH/config
    echo 0x16e0410 > $DCC_PATH/config
    echo 0x16e0420 > $DCC_PATH/config
    echo 0x16e0424 > $DCC_PATH/config
    echo 0x16e0428 > $DCC_PATH/config
    echo 0x16e042c > $DCC_PATH/config
    echo 0x16e0430 > $DCC_PATH/config
    echo 0x16e0434 > $DCC_PATH/config
    echo 0x16e0438 > $DCC_PATH/config
    echo 0x16e043c > $DCC_PATH/config
    echo 0x16e0688 > $DCC_PATH/config
    echo 0x16e0690 > $DCC_PATH/config
    echo 0x16e0700 > $DCC_PATH/config
    echo 0x16e0888 > $DCC_PATH/config
    echo 0x16e0890 > $DCC_PATH/config
    echo 0x16e0900 > $DCC_PATH/config
    echo 0x16e0904 > $DCC_PATH/config
    echo 0x16e0a40 > $DCC_PATH/config
    echo 0x16e0a48 > $DCC_PATH/config
    echo 0x16e0a88 > $DCC_PATH/config
    echo 0x16e0a90 > $DCC_PATH/config
    echo 0x16e0b00 > $DCC_PATH/config

    #A2NOC
    echo 0x1700204 > $DCC_PATH/config
    echo 0x1700240 > $DCC_PATH/config
    echo 0x1700248 > $DCC_PATH/config
    echo 0x1700288 > $DCC_PATH/config
    echo 0x1700290 > $DCC_PATH/config
    echo 0x1700300 > $DCC_PATH/config
    echo 0x1700304 > $DCC_PATH/config
    echo 0x1700308 > $DCC_PATH/config
    echo 0x170030c > $DCC_PATH/config
    echo 0x1700310 > $DCC_PATH/config
    echo 0x1700400 > $DCC_PATH/config
    echo 0x1700404 > $DCC_PATH/config
    echo 0x1700488 > $DCC_PATH/config
    echo 0x1700490 > $DCC_PATH/config
    echo 0x1700500 > $DCC_PATH/config
    echo 0x1700504 > $DCC_PATH/config
    echo 0x1700508 > $DCC_PATH/config
    echo 0x170050c > $DCC_PATH/config
    echo 0x1700c00 > $DCC_PATH/config
    echo 0x1700c04 > $DCC_PATH/config
    echo 0x1700c08 > $DCC_PATH/config
    echo 0x1700c10 > $DCC_PATH/config
    echo 0x1700c20 > $DCC_PATH/config
    echo 0x1700c24 > $DCC_PATH/config
    echo 0x1700c28 > $DCC_PATH/config
    echo 0x1700c2c > $DCC_PATH/config
    echo 0x1700c30 > $DCC_PATH/config
    echo 0x1700c34 > $DCC_PATH/config
    echo 0x1700c38 > $DCC_PATH/config
    echo 0x1700c3c > $DCC_PATH/config

    #SNOC
    echo 0x1620000 > $DCC_PATH/config
    echo 0x1620004 > $DCC_PATH/config
    echo 0x1620008 > $DCC_PATH/config
    echo 0x1620010 > $DCC_PATH/config
    echo 0x1620020 > $DCC_PATH/config
    echo 0x1620024 > $DCC_PATH/config
    echo 0x1620028 > $DCC_PATH/config
    echo 0x162002c > $DCC_PATH/config
    echo 0x1620030 > $DCC_PATH/config
    echo 0x1620034 > $DCC_PATH/config
    echo 0x1620038 > $DCC_PATH/config
    echo 0x162003c > $DCC_PATH/config
    echo 0x1620100 > $DCC_PATH/config
    echo 0x1620104 > $DCC_PATH/config
    echo 0x1620108 > $DCC_PATH/config
    echo 0x1620110 > $DCC_PATH/config
    echo 0x1620200 > $DCC_PATH/config
    echo 0x1620204 > $DCC_PATH/config
    echo 0x1620240 > $DCC_PATH/config
    echo 0x1620248 > $DCC_PATH/config
    echo 0x1620288 > $DCC_PATH/config
    echo 0x162028c > $DCC_PATH/config
    echo 0x1620290 > $DCC_PATH/config
    echo 0x1620294 > $DCC_PATH/config
    echo 0x16202a8 > $DCC_PATH/config
    echo 0x16202ac > $DCC_PATH/config
    echo 0x16202b0 > $DCC_PATH/config
    echo 0x16202b4 > $DCC_PATH/config
    echo 0x1620300 > $DCC_PATH/config
    echo 0x1620400 > $DCC_PATH/config
    echo 0x1620404 > $DCC_PATH/config
    echo 0x1620488 > $DCC_PATH/config
    echo 0x1620490 > $DCC_PATH/config
    echo 0x1620500 > $DCC_PATH/config
    echo 0x1620504 > $DCC_PATH/config
    echo 0x1620508 > $DCC_PATH/config
    echo 0x162050c > $DCC_PATH/config
    echo 0x1620510 > $DCC_PATH/config
    echo 0x1620600 > $DCC_PATH/config
    echo 0x1620604 > $DCC_PATH/config
    echo 0x1620688 > $DCC_PATH/config
    echo 0x1620690 > $DCC_PATH/config
    echo 0x1620700 > $DCC_PATH/config
    echo 0x1620704 > $DCC_PATH/config
    echo 0x1620708 > $DCC_PATH/config
    echo 0x162070c > $DCC_PATH/config
    echo 0x1620710 > $DCC_PATH/config
    echo 0x1620800 > $DCC_PATH/config
    echo 0x1620804 > $DCC_PATH/config
    echo 0x1620900 > $DCC_PATH/config
    echo 0x1620a00 > $DCC_PATH/config
    echo 0x1620a04 > $DCC_PATH/config
    echo 0x1620b00 > $DCC_PATH/config
    echo 0x1620b04 > $DCC_PATH/config
    echo 0x1620e00 > $DCC_PATH/config
    echo 0x1620e04 > $DCC_PATH/config
    echo 0x1620e88 > $DCC_PATH/config
    echo 0x1620e90 > $DCC_PATH/config
    echo 0x1620f00 > $DCC_PATH/config
    echo 0x1639000 > $DCC_PATH/config
    echo 0x1639004 > $DCC_PATH/config
    echo 0x1639088 > $DCC_PATH/config
    echo 0x1639090 > $DCC_PATH/config
    echo 0x1639100 > $DCC_PATH/config

    #LPASS AGNOC
    echo 0x3c41800 > $DCC_PATH/config
    echo 0x3c41804 > $DCC_PATH/config
    echo 0x3c41880 > $DCC_PATH/config
    echo 0x3c41888 > $DCC_PATH/config
    echo 0x3c41890 > $DCC_PATH/config
    echo 0x3c41900 > $DCC_PATH/config
    echo 0x3c41a00 > $DCC_PATH/config
    echo 0x3c41a04 > $DCC_PATH/config
    echo 0x3c41a40 > $DCC_PATH/config
    echo 0x3c41a48 > $DCC_PATH/config
    echo 0x3c41c00 > $DCC_PATH/config
    echo 0x3c41c04 > $DCC_PATH/config
    echo 0x3c41d00 > $DCC_PATH/config
    echo 0x3c42680 > $DCC_PATH/config
    echo 0x3c42684 > $DCC_PATH/config
    echo 0x3c42688 > $DCC_PATH/config
    echo 0x3c42690 > $DCC_PATH/config
    echo 0x3c42698 > $DCC_PATH/config
    echo 0x3c426a0 > $DCC_PATH/config
    echo 0x3c426a4 > $DCC_PATH/config
    echo 0x3c426a8 > $DCC_PATH/config
    echo 0x3c426ac > $DCC_PATH/config
    echo 0x3c426b0 > $DCC_PATH/config
    echo 0x3c426b4 > $DCC_PATH/config
    echo 0x3c426b8 > $DCC_PATH/config
    echo 0x3c426bc > $DCC_PATH/config

    #MMSS NOC
    # echo 0x1740000 > $DCC_PATH/config
    # echo 0x1740004 > $DCC_PATH/config
    # echo 0x1740008 > $DCC_PATH/config
    # echo 0x1740010 > $DCC_PATH/config
    # echo 0x1740018 > $DCC_PATH/config
    # echo 0x1740020 > $DCC_PATH/config
    # echo 0x1740024 > $DCC_PATH/config
    # echo 0x1740028 > $DCC_PATH/config
    # echo 0x174002c > $DCC_PATH/config
    # echo 0x1740030 > $DCC_PATH/config
    # echo 0x1740034 > $DCC_PATH/config
    # echo 0x1740038 > $DCC_PATH/config
    # echo 0x174003c > $DCC_PATH/config
    # echo 0x1740240 > $DCC_PATH/config
    # echo 0x1740248 > $DCC_PATH/config
    # echo 0x1740280 > $DCC_PATH/config
    # echo 0x1740288 > $DCC_PATH/config
    # echo 0x1740290 > $DCC_PATH/config
    # echo 0x1740300 > $DCC_PATH/config
    # echo 0x1740304 > $DCC_PATH/config
    # echo 0x1740308 > $DCC_PATH/config
    # echo 0x174030c > $DCC_PATH/config
    # echo 0x1740310 > $DCC_PATH/config
    # echo 0x1740314 > $DCC_PATH/config
    # echo 0x1740318 > $DCC_PATH/config

    #GEMNOC
    echo 0x9681010 > $DCC_PATH/config
    echo 0x9681014 > $DCC_PATH/config
    echo 0x9681018 > $DCC_PATH/config
    echo 0x968101c > $DCC_PATH/config
    echo 0x9681020 > $DCC_PATH/config
    echo 0x9681024 > $DCC_PATH/config
    echo 0x9681028 > $DCC_PATH/config
    echo 0x968102c > $DCC_PATH/config
    echo 0x9681030 > $DCC_PATH/config
    echo 0x9681034 > $DCC_PATH/config
    echo 0x968103c > $DCC_PATH/config
    echo 0x9692000 > $DCC_PATH/config
    echo 0x9692004 > $DCC_PATH/config
    echo 0x9692008 > $DCC_PATH/config
    echo 0x9692040 > $DCC_PATH/config
    echo 0x9692048 > $DCC_PATH/config
    echo 0x9695000 > $DCC_PATH/config
    echo 0x9695004 > $DCC_PATH/config
    echo 0x9695080 > $DCC_PATH/config
    echo 0x9695084 > $DCC_PATH/config
    echo 0x9695088 > $DCC_PATH/config
    echo 0x969508c > $DCC_PATH/config
    echo 0x9695090 > $DCC_PATH/config
    echo 0x9695094 > $DCC_PATH/config
    echo 0x96950a0 > $DCC_PATH/config
    echo 0x96950a8 > $DCC_PATH/config
    echo 0x96950b0 > $DCC_PATH/config
    echo 0x9695100 > $DCC_PATH/config
    echo 0x9695104 > $DCC_PATH/config
    echo 0x9695108 > $DCC_PATH/config
    echo 0x969510c > $DCC_PATH/config
    echo 0x9695110 > $DCC_PATH/config
    echo 0x9695114 > $DCC_PATH/config
    echo 0x9695118 > $DCC_PATH/config
    echo 0x969511c > $DCC_PATH/config
    echo 0x9696000 > $DCC_PATH/config
    echo 0x9696004 > $DCC_PATH/config
    echo 0x9696080 > $DCC_PATH/config
    echo 0x9696088 > $DCC_PATH/config
    echo 0x9696090 > $DCC_PATH/config
    echo 0x9696100 > $DCC_PATH/config
    echo 0x9696104 > $DCC_PATH/config
    echo 0x9696108 > $DCC_PATH/config
    echo 0x969610c > $DCC_PATH/config
    echo 0x9696114 > $DCC_PATH/config
    echo 0x9696118 > $DCC_PATH/config
    echo 0x969611c > $DCC_PATH/config
    echo 0x9698000 > $DCC_PATH/config
    echo 0x9698004 > $DCC_PATH/config
    echo 0x9698008 > $DCC_PATH/config
    echo 0x9698010 > $DCC_PATH/config
    echo 0x9698100 > $DCC_PATH/config
    echo 0x9698104 > $DCC_PATH/config
    echo 0x9698108 > $DCC_PATH/config
    echo 0x9698110 > $DCC_PATH/config
    echo 0x9698118 > $DCC_PATH/config
    echo 0x9698120 > $DCC_PATH/config
    echo 0x9698124 > $DCC_PATH/config
    echo 0x9698128 > $DCC_PATH/config
    echo 0x969812c > $DCC_PATH/config
    echo 0x9698130 > $DCC_PATH/config
    echo 0x9698134 > $DCC_PATH/config
    echo 0x9698138 > $DCC_PATH/config
    echo 0x969813c > $DCC_PATH/config
    echo 0x9698200 > $DCC_PATH/config
    echo 0x9698204 > $DCC_PATH/config
    echo 0x9698240 > $DCC_PATH/config
    echo 0x9698244 > $DCC_PATH/config
    echo 0x9698248 > $DCC_PATH/config
    echo 0x969824c > $DCC_PATH/config
}

config_lito_dcc_gcc(){
    #GCC
    echo 0x100000 13 > $DCC_PATH/config
    echo 0x100040 > $DCC_PATH/config
    echo 0x100100 4 > $DCC_PATH/config
    echo 0x101000 13 > $DCC_PATH/config
    echo 0x10103c > $DCC_PATH/config
    echo 0x101040 > $DCC_PATH/config
    echo 0x102000 13 > $DCC_PATH/config
    echo 0x10203c > $DCC_PATH/config
    echo 0x102040 > $DCC_PATH/config
    echo 0x103000 13 > $DCC_PATH/config
    echo 0x10303c > $DCC_PATH/config
    echo 0x103040 > $DCC_PATH/config
    echo 0x10401c > $DCC_PATH/config
    echo 0x105008 > $DCC_PATH/config
    echo 0x10504c > $DCC_PATH/config
    echo 0x105064 > $DCC_PATH/config
    echo 0x106100 > $DCC_PATH/config
    echo 0x109004 > $DCC_PATH/config
    echo 0x109008 > $DCC_PATH/config
    echo 0x10900c > $DCC_PATH/config
    echo 0x109010 > $DCC_PATH/config
    echo 0x109014 > $DCC_PATH/config
    echo 0x109018 > $DCC_PATH/config
    echo 0x10901c > $DCC_PATH/config
    echo 0x109020 > $DCC_PATH/config
    echo 0x109024 > $DCC_PATH/config
    echo 0x10904c > $DCC_PATH/config
    echo 0x10915c > $DCC_PATH/config
    echo 0x109160 > $DCC_PATH/config
    echo 0x109464 > $DCC_PATH/config
    echo 0x109468 > $DCC_PATH/config
    echo 0x10946c > $DCC_PATH/config
    echo 0x109470 > $DCC_PATH/config
    echo 0x109478 > $DCC_PATH/config
    echo 0x113000 > $DCC_PATH/config
    echo 0x113004 > $DCC_PATH/config
    echo 0x113008 > $DCC_PATH/config
    echo 0x11300c > $DCC_PATH/config
    echo 0x113010 > $DCC_PATH/config
    echo 0x113014 > $DCC_PATH/config
    echo 0x113018 > $DCC_PATH/config
    echo 0x11301c > $DCC_PATH/config
    echo 0x113020 > $DCC_PATH/config
    echo 0x113024 > $DCC_PATH/config
    echo 0x113028 > $DCC_PATH/config
    echo 0x11302c > $DCC_PATH/config
    echo 0x113030 > $DCC_PATH/config
    echo 0x11303c > $DCC_PATH/config
    echo 0x113040 > $DCC_PATH/config
    echo 0x117024 > $DCC_PATH/config
    echo 0x117154 > $DCC_PATH/config
    echo 0x117284 > $DCC_PATH/config
    echo 0x1173b4 > $DCC_PATH/config
    echo 0x1174e4 > $DCC_PATH/config
    echo 0x117614 > $DCC_PATH/config
    echo 0x118024 > $DCC_PATH/config
    echo 0x118154 > $DCC_PATH/config
    echo 0x118284 > $DCC_PATH/config
    echo 0x1183b4 > $DCC_PATH/config
    echo 0x1184e4 > $DCC_PATH/config
    echo 0x118614 > $DCC_PATH/config
    echo 0x11a000 > $DCC_PATH/config
    echo 0x11a004 > $DCC_PATH/config
    echo 0x11a008 > $DCC_PATH/config
    echo 0x11a00c > $DCC_PATH/config
    echo 0x11a010 > $DCC_PATH/config
    echo 0x11a014 > $DCC_PATH/config
    echo 0x11a018 > $DCC_PATH/config
    echo 0x11a01c > $DCC_PATH/config
    echo 0x11a020 > $DCC_PATH/config
    echo 0x11a024 > $DCC_PATH/config
    echo 0x11a028 > $DCC_PATH/config
    echo 0x11a02c > $DCC_PATH/config
    echo 0x11a030 > $DCC_PATH/config
    echo 0x11a03c > $DCC_PATH/config
    echo 0x11a040 > $DCC_PATH/config
    echo 0x11b000 > $DCC_PATH/config
    echo 0x11b004 > $DCC_PATH/config
    echo 0x11b008 > $DCC_PATH/config
    echo 0x11b00c > $DCC_PATH/config
    echo 0x11b010 > $DCC_PATH/config
    echo 0x11b014 > $DCC_PATH/config
    echo 0x11b018 > $DCC_PATH/config
    echo 0x11b01c > $DCC_PATH/config
    echo 0x11b020 > $DCC_PATH/config
    echo 0x11b024 > $DCC_PATH/config
    echo 0x11b028 > $DCC_PATH/config
    echo 0x11b02c > $DCC_PATH/config
    echo 0x11b030 > $DCC_PATH/config
    echo 0x11b03c > $DCC_PATH/config
    echo 0x11b040 > $DCC_PATH/config
    echo 0x11c000 > $DCC_PATH/config
    echo 0x11c004 > $DCC_PATH/config
    echo 0x11c008 > $DCC_PATH/config
    echo 0x11c00c > $DCC_PATH/config
    echo 0x11c010 > $DCC_PATH/config
    echo 0x11c014 > $DCC_PATH/config
    echo 0x11c018 > $DCC_PATH/config
    echo 0x11c01c > $DCC_PATH/config
    echo 0x11c020 > $DCC_PATH/config
    echo 0x11c024 > $DCC_PATH/config
    echo 0x11c028 > $DCC_PATH/config
    echo 0x11c02c > $DCC_PATH/config
    echo 0x11c030 > $DCC_PATH/config
    echo 0x11c03c > $DCC_PATH/config
    echo 0x11c040 > $DCC_PATH/config
    echo 0x11d000 > $DCC_PATH/config
    echo 0x11d004 > $DCC_PATH/config
    echo 0x11d008 > $DCC_PATH/config
    echo 0x11d00c > $DCC_PATH/config
    echo 0x11d010 > $DCC_PATH/config
    echo 0x11d014 > $DCC_PATH/config
    echo 0x11d018 > $DCC_PATH/config
    echo 0x11d01c > $DCC_PATH/config
    echo 0x11d020 > $DCC_PATH/config
    echo 0x11d024 > $DCC_PATH/config
    echo 0x11d028 > $DCC_PATH/config
    echo 0x11d02c > $DCC_PATH/config
    echo 0x11d030 > $DCC_PATH/config
    echo 0x11d03c > $DCC_PATH/config
    echo 0x11d040 > $DCC_PATH/config
    echo 0x120004 > $DCC_PATH/config
    echo 0x123020 > $DCC_PATH/config
    echo 0x127004 > $DCC_PATH/config
    echo 0x135000 > $DCC_PATH/config
    echo 0x13500c > $DCC_PATH/config
    echo 0x135010 > $DCC_PATH/config
    echo 0x141024 > $DCC_PATH/config
    echo 0x14401c > $DCC_PATH/config
    echo 0x144164 > $DCC_PATH/config
    echo 0x144284 > $DCC_PATH/config
    echo 0x1442a0 > $DCC_PATH/config
    echo 0x1443d0 > $DCC_PATH/config
    echo 0x145000 > $DCC_PATH/config
    echo 0x145004 > $DCC_PATH/config
    echo 0x145008 > $DCC_PATH/config
    echo 0x145010 > $DCC_PATH/config
    echo 0x145018 > $DCC_PATH/config
    echo 0x145044 > $DCC_PATH/config
    echo 0x145378 > $DCC_PATH/config
    echo 0x14537c > $DCC_PATH/config
    echo 0x145380 > $DCC_PATH/config
    echo 0x145384 > $DCC_PATH/config
    echo 0x145398 > $DCC_PATH/config
    echo 0x147000 > $DCC_PATH/config
    echo 0x14700c > $DCC_PATH/config
    echo 0x147014 > $DCC_PATH/config
    echo 0x17100c > $DCC_PATH/config
    echo 0x171010 > $DCC_PATH/config
    echo 0x171018 > $DCC_PATH/config
    echo 0x171250 > $DCC_PATH/config
    echo 0x174000 > $DCC_PATH/config
    echo 0x174004 > $DCC_PATH/config
    echo 0x174008 > $DCC_PATH/config
    echo 0x17400c > $DCC_PATH/config
    echo 0x174010 > $DCC_PATH/config
    echo 0x174014 > $DCC_PATH/config
    echo 0x174018 > $DCC_PATH/config
    echo 0x17401c > $DCC_PATH/config
    echo 0x174020 > $DCC_PATH/config
    echo 0x174024 > $DCC_PATH/config
    echo 0x174028 > $DCC_PATH/config
    echo 0x17402c > $DCC_PATH/config
    echo 0x174030 > $DCC_PATH/config
    echo 0x17403c > $DCC_PATH/config
    echo 0x174040 > $DCC_PATH/config
    echo 0x176000 > $DCC_PATH/config
    echo 0x176004 > $DCC_PATH/config
    echo 0x176008 > $DCC_PATH/config
    echo 0x17600c > $DCC_PATH/config
    echo 0x176010 > $DCC_PATH/config
    echo 0x176014 > $DCC_PATH/config
    echo 0x176018 > $DCC_PATH/config
    echo 0x17601c > $DCC_PATH/config
    echo 0x176020 > $DCC_PATH/config
    echo 0x176024 > $DCC_PATH/config
    echo 0x176028 > $DCC_PATH/config
    echo 0x17602c > $DCC_PATH/config
    echo 0x176030 > $DCC_PATH/config
    echo 0x17603c > $DCC_PATH/config
    echo 0x176040 > $DCC_PATH/config
    echo 0x178040 > $DCC_PATH/config
    echo 0x182010 > $DCC_PATH/config
    echo 0x182884 > $DCC_PATH/config
    echo 0x182888 > $DCC_PATH/config
    echo 0x18288c > $DCC_PATH/config
    echo 0x182894 > $DCC_PATH/config
    echo 0x182898 > $DCC_PATH/config
    echo 0x18289c > $DCC_PATH/config
    echo 0x183004 > $DCC_PATH/config
    echo 0x183008 > $DCC_PATH/config
    echo 0x18300c > $DCC_PATH/config
    echo 0x183024 > $DCC_PATH/config
    echo 0x183140 > $DCC_PATH/config
    echo 0x18323c > $DCC_PATH/config
    echo 0x189004 > $DCC_PATH/config
    echo 0x189008 > $DCC_PATH/config
    echo 0x18900c > $DCC_PATH/config
    echo 0x189010 > $DCC_PATH/config
    echo 0x189014 > $DCC_PATH/config
    echo 0x189018 > $DCC_PATH/config
    echo 0x18901c > $DCC_PATH/config
    echo 0x189024 > $DCC_PATH/config
    echo 0x189044 > $DCC_PATH/config
    echo 0x189164 > $DCC_PATH/config
    echo 0x190004 > $DCC_PATH/config
    echo 0x190008 > $DCC_PATH/config
    echo 0x19000c > $DCC_PATH/config
    echo 0x190010 > $DCC_PATH/config
    echo 0x190014 > $DCC_PATH/config
    echo 0x190018 > $DCC_PATH/config
    echo 0x191100 > $DCC_PATH/config
    echo 0x192100 > $DCC_PATH/config
    echo 0x193100 > $DCC_PATH/config
    echo 0x194100 > $DCC_PATH/config
    echo 0x195100 > $DCC_PATH/config
    echo 0x196100 > $DCC_PATH/config
    echo 0x197100 > $DCC_PATH/config
    echo 0x19b100 > $DCC_PATH/config
    echo 0x19c100 > $DCC_PATH/config
    echo 0x3D91078 > $DCC_PATH/config
    echo 0x3D95000 > $DCC_PATH/config
    echo 0x10B008 0x1 > $DCC_PATH/config_write
}

config_lito_dcc_pimem()
{
    echo 0x610100 11 > $DCC_PATH/config
}

config_lito_dcc_misc()
{
    echo 0xC2A2040 > $DCC_PATH/config
    #Modem
    echo 0xB2C4520 > $DCC_PATH/config
    echo 0xB2C1020 > $DCC_PATH/config
    echo 0xB2C1024 > $DCC_PATH/config
    echo 0xB2C1030 > $DCC_PATH/config
    echo 0xB2C1200 > $DCC_PATH/config
    echo 0xB2C1214 > $DCC_PATH/config
    echo 0xB2C1228 > $DCC_PATH/config
    echo 0xB2C123C > $DCC_PATH/config
    echo 0xB2C1250 > $DCC_PATH/config
    echo 0xB2C1204 > $DCC_PATH/config
    echo 0xB2C1218 > $DCC_PATH/config
    echo 0xB2C122C > $DCC_PATH/config
    echo 0xB2C1240 > $DCC_PATH/config
    echo 0xB2C1254 > $DCC_PATH/config
    echo 0xB2C1208 > $DCC_PATH/config
    echo 0xB2C121C > $DCC_PATH/config
    echo 0xB2C1230 > $DCC_PATH/config
    echo 0xB2C1244 > $DCC_PATH/config
    echo 0xB2C1258 > $DCC_PATH/config
    echo 0xB2C4510 > $DCC_PATH/config
    echo 0xB2C4514 > $DCC_PATH/config
    echo 0xB2C0010 > $DCC_PATH/config
    echo 0xB2C0014 > $DCC_PATH/config
    echo 0xB2C0900 > $DCC_PATH/config
    echo 0xB2C0904 > $DCC_PATH/config

    echo 0x04082028 > $DCC_PATH/config
    echo 0x18A004 > $DCC_PATH/config
    echo 0x04080044 > $DCC_PATH/config
    echo 0x04080304 > $DCC_PATH/config

    echo 0x4200010 > $DCC_PATH/config
    echo 0x4200014 > $DCC_PATH/config
    echo 0x4200018 > $DCC_PATH/config
    echo 0x4200030 > $DCC_PATH/config
    echo 0x4200038 > $DCC_PATH/config
    echo 0x4200040 > $DCC_PATH/config
    echo 0x4200048 > $DCC_PATH/config
    echo 0x42000D0 > $DCC_PATH/config
    echo 0x4200210 > $DCC_PATH/config
    echo 0x4200230 > $DCC_PATH/config
    echo 0x4200250 > $DCC_PATH/config
    echo 0x4200270 > $DCC_PATH/config
    echo 0x4200290 > $DCC_PATH/config
    echo 0x42002B0 > $DCC_PATH/config
    echo 0x4200208 > $DCC_PATH/config
    echo 0x4200228 > $DCC_PATH/config
    echo 0x4200248 > $DCC_PATH/config
    echo 0x4200268 > $DCC_PATH/config
    echo 0x4200288 > $DCC_PATH/config
    echo 0x42002A8 > $DCC_PATH/config
    echo 0x420020C > $DCC_PATH/config
    echo 0x420022C > $DCC_PATH/config
    echo 0x420024C > $DCC_PATH/config
    echo 0x420026C > $DCC_PATH/config
    echo 0x420028C > $DCC_PATH/config
    echo 0x42002AC > $DCC_PATH/config
    echo 0x4200404 > $DCC_PATH/config
    echo 0x4200408 > $DCC_PATH/config
    echo 0x4200400 > $DCC_PATH/config
    echo 0x4200D04 > $DCC_PATH/config

    echo 0x4130010 > $DCC_PATH/config 
    echo 0x4130014 > $DCC_PATH/config
    echo 0x4130018 > $DCC_PATH/config
    echo 0x4130210 > $DCC_PATH/config
    echo 0x4130230 > $DCC_PATH/config
    echo 0x4130250 > $DCC_PATH/config
    echo 0x4130270 > $DCC_PATH/config
    echo 0x4130290 > $DCC_PATH/config
    echo 0x41302B0 > $DCC_PATH/config
    echo 0x4130208 > $DCC_PATH/config
    echo 0x4130228 > $DCC_PATH/config
    echo 0x4130248 > $DCC_PATH/config
    echo 0x4130268 > $DCC_PATH/config
    echo 0x4130288 > $DCC_PATH/config
    echo 0x41302A8 > $DCC_PATH/config
    echo 0x413020C > $DCC_PATH/config
    echo 0x413022C > $DCC_PATH/config
    echo 0x413024C > $DCC_PATH/config
    echo 0x413026C > $DCC_PATH/config
    echo 0x413028C > $DCC_PATH/config
    echo 0x41302AC > $DCC_PATH/config
    echo 0x4130400 > $DCC_PATH/config
    echo 0x4130404 > $DCC_PATH/config
    echo 0x4130408 > $DCC_PATH/config

    #ADSP
    echo 0xB254520 > $DCC_PATH/config
    echo 0xB251020 > $DCC_PATH/config
    echo 0xB251024 > $DCC_PATH/config
    echo 0xB251030 > $DCC_PATH/config
    echo 0xB251200 > $DCC_PATH/config
    echo 0xB251214 > $DCC_PATH/config
    echo 0xB251228 > $DCC_PATH/config
    echo 0xB25123C > $DCC_PATH/config
    echo 0xB251250 > $DCC_PATH/config
    echo 0xB251204 > $DCC_PATH/config
    echo 0xB251218 > $DCC_PATH/config
    echo 0xB25122C > $DCC_PATH/config
    echo 0xB251240 > $DCC_PATH/config
    echo 0xB251254 > $DCC_PATH/config
    echo 0xB251208 > $DCC_PATH/config
    echo 0xB25121C > $DCC_PATH/config
    echo 0xB251230 > $DCC_PATH/config
    echo 0xB251244 > $DCC_PATH/config
    echo 0xB251258 > $DCC_PATH/config
    echo 0xB254510 > $DCC_PATH/config
    echo 0xB254514 > $DCC_PATH/config
    echo 0xB250010 > $DCC_PATH/config
    echo 0xB250014 > $DCC_PATH/config
    echo 0xB250900 > $DCC_PATH/config
    echo 0xB250904 > $DCC_PATH/config

    echo 0x3500000 > $DCC_PATH/config
    echo 0x3500004 > $DCC_PATH/config
    echo 0x3500008 > $DCC_PATH/config
    echo 0x350000c > $DCC_PATH/config
    echo 0x3500010 > $DCC_PATH/config
    echo 0x3500014 > $DCC_PATH/config
    echo 0x3500018 > $DCC_PATH/config
    echo 0x350001c > $DCC_PATH/config
    echo 0x3500020 > $DCC_PATH/config
    echo 0x3500024 > $DCC_PATH/config
    echo 0x3500028 > $DCC_PATH/config
    echo 0x350002c > $DCC_PATH/config
    echo 0x3500030 > $DCC_PATH/config
    echo 0x3500034 > $DCC_PATH/config
    echo 0x3500038 > $DCC_PATH/config
    echo 0x350003c > $DCC_PATH/config
    echo 0x3500040 > $DCC_PATH/config
    echo 0x3500044 > $DCC_PATH/config
    echo 0x3500048 > $DCC_PATH/config
    echo 0x35000d0 > $DCC_PATH/config
    echo 0x35000d8 > $DCC_PATH/config
    echo 0x3500100 > $DCC_PATH/config
    echo 0x3500104 > $DCC_PATH/config
    echo 0x3500108 > $DCC_PATH/config
    echo 0x3500200 > $DCC_PATH/config
    echo 0x3500204 > $DCC_PATH/config
    echo 0x3500224 > $DCC_PATH/config
    echo 0x3500244 > $DCC_PATH/config
    echo 0x3500264 > $DCC_PATH/config
    echo 0x3500284 > $DCC_PATH/config
    echo 0x35002a4 > $DCC_PATH/config
    echo 0x3500208 > $DCC_PATH/config
    echo 0x3500228 > $DCC_PATH/config
    echo 0x3500248 > $DCC_PATH/config
    echo 0x3500268 > $DCC_PATH/config
    echo 0x3500288 > $DCC_PATH/config
    echo 0x35002a8 > $DCC_PATH/config
    echo 0x350020c > $DCC_PATH/config
    echo 0x350022c > $DCC_PATH/config
    echo 0x350024c > $DCC_PATH/config
    echo 0x350026c > $DCC_PATH/config
    echo 0x350028c > $DCC_PATH/config
    echo 0x35002ac > $DCC_PATH/config
    echo 0x3500210 > $DCC_PATH/config
    echo 0x3500230 > $DCC_PATH/config
    echo 0x3500250 > $DCC_PATH/config
    echo 0x3500270 > $DCC_PATH/config
    echo 0x3500290 > $DCC_PATH/config
    echo 0x35002b0 > $DCC_PATH/config
    echo 0x3500400 > $DCC_PATH/config
    echo 0x3500404 > $DCC_PATH/config
    echo 0x3500408 > $DCC_PATH/config
    echo 0x3500450 > $DCC_PATH/config
    echo 0x3500454 > $DCC_PATH/config
    echo 0x3500458 > $DCC_PATH/config
    echo 0x350045c > $DCC_PATH/config
    echo 0x3500460 > $DCC_PATH/config
    echo 0x3500464 > $DCC_PATH/config
    echo 0x3500490 > $DCC_PATH/config
    echo 0x3500494 > $DCC_PATH/config
    echo 0x3500498 > $DCC_PATH/config
    echo 0x350049c > $DCC_PATH/config
    echo 0x35004a0 > $DCC_PATH/config
    echo 0x35004a4 > $DCC_PATH/config
    echo 0x35004a8 > $DCC_PATH/config
    echo 0x35004ac > $DCC_PATH/config
    echo 0x35004b0 > $DCC_PATH/config
    echo 0x35004b4 > $DCC_PATH/config
    echo 0x35004b8 > $DCC_PATH/config
    echo 0x3500500 > $DCC_PATH/config
    echo 0x3500504 > $DCC_PATH/config
    echo 0x3500508 > $DCC_PATH/config
    echo 0x350050c > $DCC_PATH/config
    echo 0x3500d00 > $DCC_PATH/config
    echo 0x3500d04 > $DCC_PATH/config
    echo 0x3500d10 > $DCC_PATH/config
    echo 0x3500fb0 > $DCC_PATH/config
    echo 0x3501250 > $DCC_PATH/config
    echo 0x35014f0 > $DCC_PATH/config
    echo 0x3501790 > $DCC_PATH/config
    echo 0x3501a30 > $DCC_PATH/config
    echo 0x3500d14 > $DCC_PATH/config
    echo 0x3500fb4 > $DCC_PATH/config
    echo 0x3501254 > $DCC_PATH/config
    echo 0x35014f4 > $DCC_PATH/config
    echo 0x3501794 > $DCC_PATH/config
    echo 0x3501a34 > $DCC_PATH/config
    echo 0x3500d18 > $DCC_PATH/config
    echo 0x3500fb8 > $DCC_PATH/config
    echo 0x3501258 > $DCC_PATH/config
    echo 0x35014f8 > $DCC_PATH/config
    echo 0x3501798 > $DCC_PATH/config
    echo 0x3501a38 > $DCC_PATH/config
    echo 0x3500d1c > $DCC_PATH/config
    echo 0x3500fbc > $DCC_PATH/config
    echo 0x350125c > $DCC_PATH/config
    echo 0x35014fc > $DCC_PATH/config
    echo 0x350179c > $DCC_PATH/config
    echo 0x3501a3c > $DCC_PATH/config
    echo 0x3500d30 > $DCC_PATH/config
    echo 0x3500d44 > $DCC_PATH/config
    echo 0x3500d58 > $DCC_PATH/config
    echo 0x3500d6c > $DCC_PATH/config
    echo 0x3500d80 > $DCC_PATH/config
    echo 0x3500d94 > $DCC_PATH/config
    echo 0x3500da8 > $DCC_PATH/config
    echo 0x3500dbc > $DCC_PATH/config
    echo 0x3500dd0 > $DCC_PATH/config
    echo 0x3500de4 > $DCC_PATH/config
    echo 0x3500df8 > $DCC_PATH/config
    echo 0x3500e0c > $DCC_PATH/config
    echo 0x3500e20 > $DCC_PATH/config
    echo 0x3500e34 > $DCC_PATH/config
    echo 0x3500e48 > $DCC_PATH/config
    echo 0x3500e5c > $DCC_PATH/config
    echo 0x3501510 > $DCC_PATH/config
    echo 0x3501524 > $DCC_PATH/config
    echo 0x3501538 > $DCC_PATH/config
    echo 0x350154c > $DCC_PATH/config
    echo 0x3501560 > $DCC_PATH/config
    echo 0x3501574 > $DCC_PATH/config
    echo 0x3501588 > $DCC_PATH/config
    echo 0x350159c > $DCC_PATH/config
    echo 0x35015b0 > $DCC_PATH/config
    echo 0x35015c4 > $DCC_PATH/config
    echo 0x35015d8 > $DCC_PATH/config
    echo 0x35015ec > $DCC_PATH/config
    echo 0x3501600 > $DCC_PATH/config
    echo 0x3501614 > $DCC_PATH/config
    echo 0x3501628 > $DCC_PATH/config
    echo 0x350163c > $DCC_PATH/config
    echo 0x3500d34 > $DCC_PATH/config
    echo 0x3500d48 > $DCC_PATH/config
    echo 0x3500d5c > $DCC_PATH/config
    echo 0x3500d70 > $DCC_PATH/config
    echo 0x3500d84 > $DCC_PATH/config
    echo 0x3500d98 > $DCC_PATH/config
    echo 0x3500dac > $DCC_PATH/config
    echo 0x3500dc0 > $DCC_PATH/config
    echo 0x3500dd4 > $DCC_PATH/config
    echo 0x3500de8 > $DCC_PATH/config
    echo 0x3500dfc > $DCC_PATH/config
    echo 0x3500e10 > $DCC_PATH/config
    echo 0x3500e24 > $DCC_PATH/config
    echo 0x3500e38 > $DCC_PATH/config
    echo 0x3500e4c > $DCC_PATH/config
    echo 0x3500e60 > $DCC_PATH/config
    echo 0x3501514 > $DCC_PATH/config
    echo 0x3501528 > $DCC_PATH/config
    echo 0x350153c > $DCC_PATH/config
    echo 0x3501550 > $DCC_PATH/config
    echo 0x3501564 > $DCC_PATH/config
    echo 0x3501578 > $DCC_PATH/config
    echo 0x350158c > $DCC_PATH/config
    echo 0x35015a0 > $DCC_PATH/config
    echo 0x35015b4 > $DCC_PATH/config
    echo 0x35015c8 > $DCC_PATH/config
    echo 0x35015dc > $DCC_PATH/config
    echo 0x35015f0 > $DCC_PATH/config
    echo 0x3501604 > $DCC_PATH/config
    echo 0x3501618 > $DCC_PATH/config
    echo 0x350162c > $DCC_PATH/config
    echo 0x3501640 > $DCC_PATH/config
    echo 0x3500d38 > $DCC_PATH/config
    echo 0x3500d4c > $DCC_PATH/config
    echo 0x3500d60 > $DCC_PATH/config
    echo 0x3500d74 > $DCC_PATH/config
    echo 0x3500d88 > $DCC_PATH/config
    echo 0x3500d9c > $DCC_PATH/config
    echo 0x3500db0 > $DCC_PATH/config
    echo 0x3500dc4 > $DCC_PATH/config
    echo 0x3500dd8 > $DCC_PATH/config
    echo 0x3500dec > $DCC_PATH/config
    echo 0x3500e00 > $DCC_PATH/config
    echo 0x3500e14 > $DCC_PATH/config
    echo 0x3500e28 > $DCC_PATH/config
    echo 0x3500e3c > $DCC_PATH/config
    echo 0x3500e50 > $DCC_PATH/config
    echo 0x3500e64 > $DCC_PATH/config
    echo 0x3501518 > $DCC_PATH/config
    echo 0x350152c > $DCC_PATH/config
    echo 0x3501540 > $DCC_PATH/config
    echo 0x3501554 > $DCC_PATH/config
    echo 0x3501568 > $DCC_PATH/config
    echo 0x350157c > $DCC_PATH/config
    echo 0x3501590 > $DCC_PATH/config
    echo 0x35015a4 > $DCC_PATH/config
    echo 0x35015b8 > $DCC_PATH/config
    echo 0x35015cc > $DCC_PATH/config
    echo 0x35015e0 > $DCC_PATH/config
    echo 0x35015f4 > $DCC_PATH/config
    echo 0x3501608 > $DCC_PATH/config
    echo 0x350161c > $DCC_PATH/config
    echo 0x3501630 > $DCC_PATH/config
    echo 0x3501644 > $DCC_PATH/config
    echo 0x3500d3c > $DCC_PATH/config
    echo 0x3500d50 > $DCC_PATH/config
    echo 0x3500d64 > $DCC_PATH/config
    echo 0x3500d78 > $DCC_PATH/config
    echo 0x3500d8c > $DCC_PATH/config
    echo 0x3500da0 > $DCC_PATH/config
    echo 0x3500db4 > $DCC_PATH/config
    echo 0x3500dc8 > $DCC_PATH/config
    echo 0x3500ddc > $DCC_PATH/config
    echo 0x3500df0 > $DCC_PATH/config
    echo 0x3500e04 > $DCC_PATH/config
    echo 0x3500e18 > $DCC_PATH/config
    echo 0x3500e2c > $DCC_PATH/config
    echo 0x3500e40 > $DCC_PATH/config
    echo 0x3500e54 > $DCC_PATH/config
    echo 0x3500e68 > $DCC_PATH/config
    echo 0x350151c > $DCC_PATH/config
    echo 0x3501530 > $DCC_PATH/config
    echo 0x3501544 > $DCC_PATH/config
    echo 0x3501558 > $DCC_PATH/config
    echo 0x350156c > $DCC_PATH/config
    echo 0x3501580 > $DCC_PATH/config
    echo 0x3501594 > $DCC_PATH/config
    echo 0x35015a8 > $DCC_PATH/config
    echo 0x35015bc > $DCC_PATH/config
    echo 0x35015d0 > $DCC_PATH/config
    echo 0x35015e4 > $DCC_PATH/config
    echo 0x35015f8 > $DCC_PATH/config
    echo 0x350160c > $DCC_PATH/config
    echo 0x3501620 > $DCC_PATH/config
    echo 0x3501634 > $DCC_PATH/config
    echo 0x3501648 > $DCC_PATH/config
    echo 0x3502d40 > $DCC_PATH/config
    echo 0x3502d54 > $DCC_PATH/config
    echo 0x3502d68 > $DCC_PATH/config
    echo 0x3502d7c > $DCC_PATH/config
    echo 0x3502d90 > $DCC_PATH/config
    echo 0x3502da4 > $DCC_PATH/config
    echo 0x3502db8 > $DCC_PATH/config
    echo 0x3502dcc > $DCC_PATH/config
    echo 0x3502de0 > $DCC_PATH/config
    echo 0x3502df4 > $DCC_PATH/config
    echo 0x3502e08 > $DCC_PATH/config
    echo 0x3502e1c > $DCC_PATH/config
    echo 0x3502e30 > $DCC_PATH/config
    echo 0x3502e44 > $DCC_PATH/config
    echo 0x3502e58 > $DCC_PATH/config
    echo 0x3502e6c > $DCC_PATH/config
    echo 0x3503520 > $DCC_PATH/config
    echo 0x3503534 > $DCC_PATH/config
    echo 0x3503548 > $DCC_PATH/config
    echo 0x350355c > $DCC_PATH/config
    echo 0x3503570 > $DCC_PATH/config
    echo 0x3503584 > $DCC_PATH/config
    echo 0x3503598 > $DCC_PATH/config
    echo 0x35035ac > $DCC_PATH/config
    echo 0x35035c0 > $DCC_PATH/config
    echo 0x35035d4 > $DCC_PATH/config
    echo 0x35035e8 > $DCC_PATH/config
    echo 0x35035fc > $DCC_PATH/config
    echo 0x3503610 > $DCC_PATH/config
    echo 0x3503624 > $DCC_PATH/config
    echo 0x3503638 > $DCC_PATH/config
    echo 0x350364c > $DCC_PATH/config
    echo 0x3502d44 > $DCC_PATH/config
    echo 0x3502d4c > $DCC_PATH/config
    echo 0x3502d50 > $DCC_PATH/config
 
    echo 0x339200C > $DCC_PATH/config
    echo 0x338005C > $DCC_PATH/config
    echo 0x3392014 > $DCC_PATH/config
    echo 0x338005C > $DCC_PATH/config
    echo 0x33A0000 > $DCC_PATH/config
    echo 0x3389028 > $DCC_PATH/config
 
    echo 0x3388008 > $DCC_PATH/config
    echo 0x3388004 > $DCC_PATH/config
    echo 0x3382008 > $DCC_PATH/config
    echo 0x3382004 > $DCC_PATH/config
    echo 0x3381000 > $DCC_PATH/config
    echo 0x3381004 > $DCC_PATH/config
    
    echo 0x3396090 > $DCC_PATH/config
    echo 0x339609C > $DCC_PATH/config
    echo 0x3801000 > $DCC_PATH/config
    echo 0x3802004 > $DCC_PATH/config
    echo 0x3802008 > $DCC_PATH/config
    echo 0x380200C > $DCC_PATH/config
    echo 0x3802014 > $DCC_PATH/config
    echo 0x3801004 > $DCC_PATH/config

    echo 0x30B0010 > $DCC_PATH/config
    echo 0x30B0014 > $DCC_PATH/config
    echo 0x30B0018 > $DCC_PATH/config
    echo 0x30B0210 > $DCC_PATH/config
    echo 0x30B0230 > $DCC_PATH/config
    echo 0x30B0250 > $DCC_PATH/config
    echo 0x30B0270 > $DCC_PATH/config
    echo 0x30B0290 > $DCC_PATH/config
    echo 0x30B02B0 > $DCC_PATH/config
    echo 0x30B0208 > $DCC_PATH/config
    echo 0x30B0228 > $DCC_PATH/config
    echo 0x30B0248 > $DCC_PATH/config
    echo 0x30B0268 > $DCC_PATH/config
    echo 0x30B0288 > $DCC_PATH/config
    echo 0x30B02A8 > $DCC_PATH/config
    echo 0x30B020C > $DCC_PATH/config
    echo 0x30B022C > $DCC_PATH/config
    echo 0x30B024C > $DCC_PATH/config
    echo 0x30B026C > $DCC_PATH/config
    echo 0x30B028C > $DCC_PATH/config
    echo 0x30B02AC > $DCC_PATH/config
    echo 0x30B0400 > $DCC_PATH/config
    echo 0x30B0404 > $DCC_PATH/config
    echo 0x30B0408 > $DCC_PATH/config
    echo 0x3002028 > $DCC_PATH/config
    
    #CDSP
    echo 0xB2B4520 > $DCC_PATH/config
    echo 0xB2B1020 > $DCC_PATH/config
    echo 0xB2B1024 > $DCC_PATH/config
    echo 0xB2B1030 > $DCC_PATH/config
    echo 0xB2B1200 > $DCC_PATH/config
    echo 0xB2B1214 > $DCC_PATH/config
    echo 0xB2B1228 > $DCC_PATH/config
    echo 0xB2B123C > $DCC_PATH/config
    echo 0xB2B1250 > $DCC_PATH/config
    echo 0xB2B1204 > $DCC_PATH/config
    echo 0xB2B1218 > $DCC_PATH/config
    echo 0xB2B122C > $DCC_PATH/config
    echo 0xB2B1240 > $DCC_PATH/config
    echo 0xB2B1254 > $DCC_PATH/config
    echo 0xB2B1208 > $DCC_PATH/config
    echo 0xB2B121C > $DCC_PATH/config
    echo 0xB2B1230 > $DCC_PATH/config
    echo 0xB2B1244 > $DCC_PATH/config
    echo 0xB2B1258 > $DCC_PATH/config
    echo 0xB2B4510 > $DCC_PATH/config
    echo 0xB2B4514 > $DCC_PATH/config
    echo 0xB2B0010 > $DCC_PATH/config
    echo 0xB2B0014 > $DCC_PATH/config
    echo 0xB2B0900 > $DCC_PATH/config
    echo 0xB2B0904 > $DCC_PATH/config
    echo 0x80A4010 > $DCC_PATH/config
    echo 0x80A4014 > $DCC_PATH/config
    echo 0x80A4018 > $DCC_PATH/config
    echo 0x80A4030 > $DCC_PATH/config
    echo 0x80A4038 > $DCC_PATH/config
    echo 0x80A4040 > $DCC_PATH/config
    echo 0x80A4048 > $DCC_PATH/config
    echo 0x80A40D0 > $DCC_PATH/config
    echo 0x80A4210 > $DCC_PATH/config
    echo 0x80A4230 > $DCC_PATH/config
    echo 0x80A4250 > $DCC_PATH/config
    echo 0x80A4270 > $DCC_PATH/config
    echo 0x80A4290 > $DCC_PATH/config
    echo 0x80A42B0 > $DCC_PATH/config
    echo 0x80A4208 > $DCC_PATH/config
    echo 0x80A4228 > $DCC_PATH/config
    echo 0x80A4248 > $DCC_PATH/config
    echo 0x80A4268 > $DCC_PATH/config
    echo 0x80A4288 > $DCC_PATH/config
    echo 0x80A42A8 > $DCC_PATH/config
    echo 0x80A420C > $DCC_PATH/config
    echo 0x80A422C > $DCC_PATH/config
    echo 0x80A424C > $DCC_PATH/config
    echo 0x80A426C > $DCC_PATH/config
    echo 0x80A428C > $DCC_PATH/config
    echo 0x80A42AC > $DCC_PATH/config
    echo 0x80A4404 > $DCC_PATH/config
    echo 0x80A4408 > $DCC_PATH/config
    echo 0x80A4400 > $DCC_PATH/config
    echo 0x80A4D04 > $DCC_PATH/config
    echo 0x83B0010 > $DCC_PATH/config
    echo 0x83B0014 > $DCC_PATH/config
    echo 0x83B0018 > $DCC_PATH/config
    echo 0x83B0210 > $DCC_PATH/config
    echo 0x83B0230 > $DCC_PATH/config
    echo 0x83B0250 > $DCC_PATH/config
    echo 0x83B0270 > $DCC_PATH/config
    echo 0x83B0290 > $DCC_PATH/config
    echo 0x83B02B0 > $DCC_PATH/config
    echo 0x83B0208 > $DCC_PATH/config
    echo 0x83B0228 > $DCC_PATH/config
    echo 0x83B0248 > $DCC_PATH/config
    echo 0x83B0268 > $DCC_PATH/config
    echo 0x83B0288 > $DCC_PATH/config
    echo 0x83B02A8 > $DCC_PATH/config
    echo 0x83B020C > $DCC_PATH/config
    echo 0x83B022C > $DCC_PATH/config
    echo 0x83B024C > $DCC_PATH/config
    echo 0x83B026C > $DCC_PATH/config
    echo 0x83B028C > $DCC_PATH/config
    echo 0x83B02AC > $DCC_PATH/config
    echo 0x83B0400 > $DCC_PATH/config
    echo 0x83B0404 > $DCC_PATH/config
    echo 0x83B0408 > $DCC_PATH/config

    #NPU
    #echo 0x98B0010 > $DCC_PATH/config
    #echo 0x98B0014 > $DCC_PATH/config
    #echo 0x98B0018 > $DCC_PATH/config
    #echo 0x98B0210 > $DCC_PATH/config
    #echo 0x98B0230 > $DCC_PATH/config
    #echo 0x98B0250 > $DCC_PATH/config
    #echo 0x98B0270 > $DCC_PATH/config
    #echo 0x98B0290 > $DCC_PATH/config
    #echo 0x98B02B0 > $DCC_PATH/config
    #echo 0x98B0208 > $DCC_PATH/config
    #echo 0x98B0228 > $DCC_PATH/config
    #echo 0x98B0248 > $DCC_PATH/config
    #echo 0x98B0268 > $DCC_PATH/config
    #echo 0x98B0288 > $DCC_PATH/config
    #echo 0x98B02A8 > $DCC_PATH/config
    #echo 0x98B020C > $DCC_PATH/config
    #echo 0x98B022C > $DCC_PATH/config
    #echo 0x98B024C > $DCC_PATH/config
    #echo 0x98B026C > $DCC_PATH/config
    #echo 0x98B028C > $DCC_PATH/config
    #echo 0x98B02AC > $DCC_PATH/config
    #echo 0x98B0400 > $DCC_PATH/config
    #echo 0x98B0404 > $DCC_PATH/config
    #echo 0x98B0408 > $DCC_PATH/config


    echo   0x144164   1   > $DCC_PATH/config
    echo   0x1442A0   1   > $DCC_PATH/config
    echo   0x1443D0   1   > $DCC_PATH/config
    echo   0x183024   1   > $DCC_PATH/config
    echo   0x19A018   1   > $DCC_PATH/config
    echo   0x19A00C   1   > $DCC_PATH/config
    echo   0x199018   1   > $DCC_PATH/config
    echo   0x198018   1   > $DCC_PATH/config
    echo   0x100000   1   > $DCC_PATH/config
    echo   0x100004   1   > $DCC_PATH/config
    echo   0x100008   1   > $DCC_PATH/config
    echo   0x10000C   1   > $DCC_PATH/config
    echo   0x100010   1   > $DCC_PATH/config
    echo   0x100014   1   > $DCC_PATH/config
    echo   0x100018   1   > $DCC_PATH/config
    echo   0x10001C   1   > $DCC_PATH/config
    echo   0x100020   1   > $DCC_PATH/config
    echo   0x100024   1   > $DCC_PATH/config
    echo   0x100028   1   > $DCC_PATH/config
    echo   0x10002C   1   > $DCC_PATH/config
    echo   0x100030   1   > $DCC_PATH/config
    echo   0x100034   1   > $DCC_PATH/config
    echo   0x100038   1   > $DCC_PATH/config
    echo   0x10003C   1   > $DCC_PATH/config
    echo   0x100040   1   > $DCC_PATH/config
    echo   0x100044   1   > $DCC_PATH/config
    echo   0x100100   1   > $DCC_PATH/config
    echo   0x100104   1   > $DCC_PATH/config
    echo   0x100108   1   > $DCC_PATH/config
    echo   0x10010C   1   > $DCC_PATH/config
    echo   0x102000   1   > $DCC_PATH/config
    echo   0x102004   1   > $DCC_PATH/config
    echo   0x102008   1   > $DCC_PATH/config
    echo   0x10200C   1   > $DCC_PATH/config
    echo   0x102010   1   > $DCC_PATH/config
    echo   0x102014   1   > $DCC_PATH/config
    echo   0x102018   1   > $DCC_PATH/config
    echo   0x10201C   1   > $DCC_PATH/config
    echo   0x102020   1   > $DCC_PATH/config
    echo   0x102024   1   > $DCC_PATH/config
    echo   0x102028   1   > $DCC_PATH/config
    echo   0x10202C   1   > $DCC_PATH/config
    echo   0x102030   1   > $DCC_PATH/config
    echo   0x102034   1   > $DCC_PATH/config
    echo   0x102038   1   > $DCC_PATH/config
    echo   0x10203C   1   > $DCC_PATH/config
    echo   0x102040   1   > $DCC_PATH/config
    echo   0x102044   1   > $DCC_PATH/config
    echo   0x103000   1   > $DCC_PATH/config
    echo   0x103004   1   > $DCC_PATH/config
    echo   0x103008   1   > $DCC_PATH/config
    echo   0x10300C   1   > $DCC_PATH/config
    echo   0x103010   1   > $DCC_PATH/config
    echo   0x103014   1   > $DCC_PATH/config
    echo   0x103018   1   > $DCC_PATH/config
    echo   0x10301C   1   > $DCC_PATH/config
    echo   0x103020   1   > $DCC_PATH/config
    echo   0x103024   1   > $DCC_PATH/config
    echo   0x103028   1   > $DCC_PATH/config
    echo   0x10302C   1   > $DCC_PATH/config
    echo   0x103030   1   > $DCC_PATH/config
    echo   0x103034   1   > $DCC_PATH/config
    echo   0x103038   1   > $DCC_PATH/config
    echo   0x10303C   1   > $DCC_PATH/config
    echo   0x103040   1   > $DCC_PATH/config
    echo   0x103044   1   > $DCC_PATH/config
    echo   0x17E00044 1   > $DCC_PATH/config
    echo 0x18000044   1   > $DCC_PATH/config
    echo 0x18000048   1   > $DCC_PATH/config
    echo 0x1800004C   1   > $DCC_PATH/config
    echo 0x18010044   1   > $DCC_PATH/config
    echo 0x18010048   1   > $DCC_PATH/config
    echo 0x1801004C   1   > $DCC_PATH/config
    echo 0x18020044   1   > $DCC_PATH/config
    echo 0x18020048   1   > $DCC_PATH/config
    echo 0x1802004C   1   > $DCC_PATH/config
    echo 0x18030044   1   > $DCC_PATH/config
    echo 0x18030048   1   > $DCC_PATH/config
    echo 0x1803004C   1   > $DCC_PATH/config
    echo 0x18040044   1   > $DCC_PATH/config
    echo 0x18040048   1   > $DCC_PATH/config
    echo 0x1804004C   1   > $DCC_PATH/config
    echo 0x18050044   1   > $DCC_PATH/config
    echo 0x18050048   1   > $DCC_PATH/config
    echo 0x1805004C   1   > $DCC_PATH/config
    echo 0x18060044   1   > $DCC_PATH/config
    echo 0x18060048   1   > $DCC_PATH/config
    echo 0x1806004C   1   > $DCC_PATH/config
    echo 0x18070044   1   > $DCC_PATH/config
    echo 0x18070048   1   > $DCC_PATH/config
    echo 0x1807004C   1   > $DCC_PATH/config
}

config_lito_dcc_apps_rsc_pdc()
{
    #APPS RSC
    echo 0x18200010 > $DCC_PATH/config
    echo 0x18200030 > $DCC_PATH/config
    echo 0x18200038 > $DCC_PATH/config
    echo 0x18200040 > $DCC_PATH/config
    echo 0x18200048 > $DCC_PATH/config
    echo 0x18200400 > $DCC_PATH/config
    echo 0x18200404 > $DCC_PATH/config
    echo 0x18200408 > $DCC_PATH/config
    echo 0x18220038 > $DCC_PATH/config
    echo 0x18220040 > $DCC_PATH/config
    echo 0x182200d0 > $DCC_PATH/config
    echo 0x18230408 > $DCC_PATH/config

    #RPMH PDC
    echo 0xb201020 > $DCC_PATH/config
    echo 0xb201024 > $DCC_PATH/config
    echo 0xb20103c > $DCC_PATH/config
    echo 0xb204510 > $DCC_PATH/config
    echo 0xb204514 > $DCC_PATH/config
    echo 0xb204520 > $DCC_PATH/config
    echo 0xb231020 > $DCC_PATH/config
    echo 0xb231024 > $DCC_PATH/config
}

# Function lito DCC configuration
enable_lito_dcc_config()
{
    DCC_PATH="/sys/bus/platform/devices/1022000.dcc_v2"
    soc_version=`cat /sys/devices/soc0/revision`
    soc_version=${soc_version/./}

    if [ ! -d $DCC_PATH ]; then
        echo "DCC does not exist on this build."
        return
    fi

    #DCC will trigger in following order LL6 -> LL4 -> LL3
    echo 0 > $DCC_PATH/enable
    echo 1 > $DCC_PATH/config_reset
    echo 6 > $DCC_PATH/curr_list
    echo cap > $DCC_PATH/func_type
    echo sram > $DCC_PATH/data_sink
    config_lito_dcc_lpm
    config_lito_dcc_apps_rsc_pdc
    config_lito_dcc_core
    config_lito_dcc_osm
    config_lito_dcc_gemnoc
    config_lito_dcc_noc
    config_lito_dcc_gpu
    config_lito_dcc_gcc
    config_lito_dcc_pimem
    config_lito_dcc_misc
    config_lito_dcc_ddr
    config_lito_dcc_ddr

    echo 4 > $DCC_PATH/curr_list
    echo cap > $DCC_PATH/func_type
    echo sram > $DCC_PATH/data_sink
    config_lito_dcc_gemnoc
    config_lito_dcc_noc
    config_lito_dcc_cam

    echo  1 > $DCC_PATH/enable
}

enable_lito_stm_hw_events()
{
   QMI_HELPER=/system/vendor/bin/qdss_qmi_helper
}

enable_lito_core_hang_config()
{
    CORE_PATH_SILVER="/sys/devices/system/cpu/hang_detect_silver"
    CORE_PATH_GOLD="/sys/devices/system/cpu/hang_detect_gold"
    if [ ! -d $CORE_PATH ]; then
        echo "CORE hang does not exist on this build."
        return
    fi

    #set the threshold to max
    echo 0xffffffff > $CORE_PATH_SILVER/threshold
    echo 0xffffffff > $CORE_PATH_GOLD/threshold

    #To enable core hang detection
    #It's a boolean variable. Do not use Hex value to enable/disable
    echo 1 > $CORE_PATH_SILVER/enable
    echo 1 > $CORE_PATH_GOLD/enable
}

#############################function defined part end##########################################

############################function called logic start#########################################
#secure_version=`getprop ro.secure`
if [ -f /proc/oppoVersion/engVersion ]; then
    engVersion=`cat /proc/oppoVersion/engVersion`
    case "$engVersion" in
         "1")   #aging version
            enable_aging_ftrace
            enable_lito_dcc_config
            enable_lito_core_hang_config
            ;;
    esac
fi


#############################function called logic end##########################################
