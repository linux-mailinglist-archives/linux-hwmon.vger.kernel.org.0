Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66BDA7AAE91
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 Sep 2023 11:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjIVJqQ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 22 Sep 2023 05:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbjIVJqO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Sep 2023 05:46:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DDD1AC;
        Fri, 22 Sep 2023 02:46:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B323C433C7;
        Fri, 22 Sep 2023 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695375967;
        bh=2ZqJg/JyagscC0zGrbJOL5exgL9GpMI8zoZzbRLoF7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i1h9hc1vyL0d8fPYkZb5zjoNiQWrTzzy1UDHQi43TnS5vQG3oCUVHGV5CACeQmXV4
         hv2g/krywG9c+snlMzxsinwKjADXi0ZxxdDRv7UlO0wmcqcQ7sXGHnqsy2O4JlJvjr
         yBuQ+A/6MXrwNBm9vKlClwtxzXUXV5WmuR4EtFrPBmYYc+a+I8ozQkgbtzByDB74dJ
         Yss8T/iwWJlChVk46FIOC2IW/gzC6Mu41gGF5E+5jlyqCSsTC8xjFnOaTS69pb8igl
         sRcswxE7sfkCoIagyUp9JFI9cFVtwYpIpmDN3pUUkksRveUDMTmZTVBUBEwdVKjFAS
         LUoen6AzOSbQw==
Date:   Fri, 22 Sep 2023 10:45:52 +0100
From:   Simon Horman <horms@kernel.org>
To:     Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Wong Vee Khee <veekhee@apple.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Revanth Kumar Uppala <ruppala@nvidia.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jochen Henneberg <jh@henneberg-systemdesign.com>,
        David E Box <david.e.box@intel.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        bpf@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
        Tan Tee Min <tee.min.tan@linux.intel.com>,
        Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
        Lai Peter Jun Ann <jun.ann.lai@intel.com>
Subject: Re: [PATCH net-next v3 1/5] arch: x86: Add IPC mailbox accessor
 function and add SoC register access
Message-ID: <20230922094552.GY224399@kernel.org>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921121946.3025771-2-yong.liang.choong@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 21, 2023 at 08:19:42PM +0800, Choong Yong Liang wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> - Add support to use IPC command allows host to access SoC registers
> through PMC firmware that are otherwise inaccessible to the host due to
> security policies.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

...

> diff --git a/include/linux/platform_data/x86/intel_pmc_ipc.h b/include/linux/platform_data/x86/intel_pmc_ipc.h
> new file mode 100644
> index 000000000000..25ba57b8a7ea
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel_pmc_ipc.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Intel Core SoC Power Management Controller Header File
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> + *          David E. Box <david.e.box@linux.intel.com>
> + */
> +#ifndef INTEL_PMC_IPC_H
> +#define INTEL_PMC_IPC_H
> +
> +#define IPC_SOC_REGISTER_ACCESS			0xAA
> +#define IPC_SOC_SUB_CMD_READ			0x00
> +#define IPC_SOC_SUB_CMD_WRITE			0x01
> +
> +struct pmc_ipc_cmd {
> +	u32 cmd;
> +	u32 sub_cmd;
> +	u32 size;
> +	u32 wbuf[4];
> +};
> +
> +/**
> + * intel_pmc_core_ipc() - PMC IPC Mailbox accessor

nit: intel_pmc_ipc()

> + * @ipc_cmd:  struct pmc_ipc_cmd prepared with input to send
> + * @rbuf:     Allocated u32[4] array for returned IPC data
> + *
> + * Return: 0 on success. Non-zero on mailbox error
> + */
> +int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf);
> +
> +#endif /* INTEL_PMC_IPC_H */
> -- 
> 2.25.1
> 
> 
