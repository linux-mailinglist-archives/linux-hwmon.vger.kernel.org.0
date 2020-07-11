Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7648821C37D
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2020 12:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgGKKFJ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 11 Jul 2020 06:05:09 -0400
Received: from server-x.ipv4.hkg02.ds.network ([27.111.83.178]:46708 "EHLO
        mail.gtsys.com.hk" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgGKKFJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Jul 2020 06:05:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 7E2A3201411B;
        Sat, 11 Jul 2020 18:05:05 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aD-6Vkk2IvhR; Sat, 11 Jul 2020 18:05:05 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 5AD522014570;
        Sat, 11 Jul 2020 18:05:05 +0800 (HKT)
Received: from [10.128.2.32] (unknown [124.217.189.79])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id F20E7C01FBA;
        Sat, 11 Jul 2020 18:05:04 +0800 (HKT)
Subject: Re: [PATCH v5 2/2] devicetree: hwmon: shtc1: Add sensirion,shtc1.yaml
To:     Rob Herring <robh@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Jack Lo <jack.lo@gtsys.com.hk>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org
References: <20200710021536.27544-1-chris.ruehl@gtsys.com.hk>
 <20200710021536.27544-3-chris.ruehl@gtsys.com.hk>
 <20200710163153.GA2760091@bogus>
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <d45ba090-a09b-dd51-4645-bc62e90cb9bc@gtsys.com.hk>
Date:   Sat, 11 Jul 2020 18:05:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710163153.GA2760091@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 11/7/2020 12:31 am, Rob Herring wrote:
> On Fri, 10 Jul 2020 10:15:35 +0800, Chris Ruehl wrote:
>> Add documentation for the newly added DTS support in the shtc1 driver.
>> To align with the drivers logic to have high precision by default
>> a boolean sensirion,low_precision is used to switch to low precision.
>>
>> Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
>> ---
>>   .../bindings/hwmon/sensirion,shtc1.yaml       | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
>>
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Error: Documentation/devicetree/bindings/hwmon/sensirion,shtc1.example.dts:25.13-14 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/hwmon/sensirion,shtc1.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/hwmon/sensirion,shtc1.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1347: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1326414
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Hi Rob,

I did run the test and didn't had any Error. dt-schema 2020.06 installed from 
git. pip3 install -e.

Can you help?

Chris
