Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B357C63F348
	for <lists+linux-hwmon@lfdr.de>; Thu,  1 Dec 2022 16:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiLAPCI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 1 Dec 2022 10:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiLAPCI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 10:02:08 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E42513F5A;
        Thu,  1 Dec 2022 07:02:07 -0800 (PST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1p0l4d-0006Mh-Ox; Thu, 01 Dec 2022 16:02:03 +0100
Message-ID: <ac2e553f-fa8b-8b08-aba9-e04529adad34@leemhuis.info>
Date:   Thu, 1 Dec 2022 16:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] hwmon/coretemp: Simplify platform device antics
Content-Language: en-US, de-DE
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     fenghua.yu@intel.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, janusz.krzysztofik@linux.intel.com,
        lucas.demarchi@intel.com, Guenter Roeck <linux@roeck-us.net>
References: <898dbb76a54aae6ca58ceefcab9ab18beeee2fff.1668096928.git.robin.murphy@arm.com>
 <20221111213753.GA1059841@roeck-us.net>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20221111213753.GA1059841@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669906927;4713558b;
X-HE-SMSGID: 1p0l4d-0006Mh-Ox
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi, this is your Linux kernel regression tracker. I wondered what
happened to this regression fix, as things looks stalled from here --
but maybe I'm missing something.

On 11.11.22 22:37, Guenter Roeck wrote:
> On Thu, Nov 10, 2022 at 04:20:25PM +0000, Robin Murphy wrote:
>> Coretemp's vestigial platform driver is odd. All the real work is done
>> globally by the initcall and CPU hotplug notifiers, while the "driver"
>> effectively just wraps an allocation and the registration of the hwmon
>> interface in a long-winded round-trip through the driver core. The whole
>> logic of dynamically creating and destroying platform devices to bring
>> the interfaces up and down is fatally flawed right away, since it
>> notifier from a platform bus notifier.
> [...]
>> I haven't been able to fully test hotplug since I only have a
>> single-socket Intel system to hand.
> Someone with access to hardware will have to validate this.

That afaics has happened.

> For both subject and description, please avoid terms like "antics",
> "odd", or "questionable". Please describe the problem in neutral terms.

Robin, did you take care of that?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

#regzbot ignore-activity
