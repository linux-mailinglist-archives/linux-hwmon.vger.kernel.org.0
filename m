Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC562AB407
	for <lists+linux-hwmon@lfdr.de>; Mon,  9 Nov 2020 10:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgKIJxY (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 9 Nov 2020 04:53:24 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:43444 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgKIJxY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Nov 2020 04:53:24 -0500
Received: from srv.home ([10.8.0.1] ident=heh28988)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1kc3pn-000288-Sx; Mon, 09 Nov 2020 17:51:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=TtsjbntIcMpX2KsPaJ72LQzb7aN1Qcl5TJzqivd2c78=;
        b=gHn8lIKNMeuQvdSu2z6TmxCbp5pkqkAKAenXHH6QZ/EOcn8DCZzn0dsj0TqP4L6TtT/JLlRbtEULVOz9wwIEvAOBRxTyHtnJRKNjfUXjwZ2Yp9WvaLOHYDMYTvPOzbvBU4X+xYF1e1VaX7MiKfxf1L2cyfxAnTe9mPoTVVY1BhE=;
Subject: Re: [PATCH v3] applesmc: Re-work SMC comms
To:     Andreas Kemnade <andreas@kemnade.info>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        hns@goldelico.com, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
References: <70331f82-35a1-50bd-685d-0b06061dd213@fnarfbargle.com>
 <3c72ccc3-4de1-b5d0-423d-7b8c80991254@fnarfbargle.com>
 <6d071547-10ee-ca92-ec8b-4b5069d04501@bitmath.org>
 <8e117844-d62a-bcb1-398d-c59cc0d4b878@fnarfbargle.com>
 <e5a856b1-fb1a-db5d-0fde-c86d0bcca1df@bitmath.org>
 <aa60f673-427a-1a47-7593-54d1404c3c92@bitmath.org>
 <9109d059-d9cb-7464-edba-3f42aa78ce92@bitmath.org>
 <5310c0ab-0f80-1f9e-8807-066223edae13@bitmath.org>
 <57057d07-d3a0-8713-8365-7b12ca222bae@fnarfbargle.com>
 <41909045-9486-78d9-76c2-73b99a901b83@bitmath.org>
 <20201108101429.GA28460@mars.bitmath.org> <20201109094424.1c10651f@aktux>
From:   Brad Campbell <brad@fnarfbargle.com>
Message-ID: <edd79c0f-c562-24af-cd6f-a33d2e662390@fnarfbargle.com>
Date:   Mon, 9 Nov 2020 20:51:32 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201109094424.1c10651f@aktux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/11/20 7:44 pm, Andreas Kemnade wrote:
> On Sun, 8 Nov 2020 11:14:29 +0100
> Henrik Rydberg <rydberg@bitmath.org> wrote:
> 
>> On Sun, Nov 08, 2020 at 09:35:28AM +0100, Henrik Rydberg wrote:
>>> Hi Brad,
>>>
>>> On 2020-11-08 02:00, Brad Campbell wrote:  
>>>> G'day Henrik,
>>>>
>>>> I noticed you'd also loosened up the requirement for SMC_STATUS_BUSY in read_smc(). I assume
>>>> that causes problems on the early Macbook. This is revised on the one sent earlier.
>>>> If you could test this on your Air1,1 it'd be appreciated.  
>>>
>>> No, I managed to screw up the patch; you can see that I carefully added the
>>> same treatment for the read argument, being unsure if the BUSY state would
>>> remain during the AVAILABLE data phase. I can check that again, but
>>> unfortunately the patch in this email shows the same problem.
>>>
>>> I think it may be worthwhile to rethink the behavior of wait_status() here.
>>> If one machine shows no change after a certain status bit change, then
>>> perhaps the others share that behavior, and we are waiting in vain. Just
>>> imagine how many years of cpu that is, combined. ;-)  
>>
>> Here is a modification along that line.
>>
>> Compared to your latest version, this one has wait_status() return the
>> actual status on success. Instead of waiting for BUSY, it waits for
>> the other status bits, and checks BUSY afterwards. So as not to wait
>> unneccesarily, the udelay() is placed together with the single
>> outb(). The return value of send_byte_data() is augmented with
>> -EAGAIN, which is then used in send_command() to create the resend
>> loop.
>>
>> I reach 41 reads per second on the MBA1,1 with this version, which is
>> getting close to the performance prior to the problems.
>>
>> From b4405457f4ba07cff7b7e4f48c47668bee176a25 Mon Sep 17 00:00:00 2001
>> From: Brad Campbell <brad@fnarfbargle.com>
>> Date: Sun, 8 Nov 2020 12:00:03 +1100
>> Subject: [PATCH] hwmon: (applesmc) Re-work SMC comms
>>
>> Commit fff2d0f701e6 ("hwmon: (applesmc) avoid overlong udelay()")
>> introduced an issue whereby communication with the SMC became
>> unreliable with write errors like :
>>
>> [  120.378614] applesmc: send_byte(0x00, 0x0300) fail: 0x40
>> [  120.378621] applesmc: LKSB: write data fail
>> [  120.512782] applesmc: send_byte(0x00, 0x0300) fail: 0x40
>> [  120.512787] applesmc: LKSB: write data fail
>>
>> The original code appeared to be timing sensitive and was not reliable
>> with the timing changes in the aforementioned commit.
>>
>> This patch re-factors the SMC communication to remove the timing
>> dependencies and restore function with the changes previously
>> committed.
>>
>> Tested on : MacbookAir6,2 MacBookPro11,1 iMac12,2, MacBookAir1,1,
>> MacBookAir3,1
>>
>> Fixes: fff2d0f701e6 ("hwmon: (applesmc) avoid overlong udelay()")
>> Reported-by: Andreas Kemnade <andreas@kemnade.info>
>> Tested-by: Andreas Kemnade <andreas@kemnade.info> # MacBookAir6,2
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Brad Campbell <brad@fnarfbargle.com>
>> Signed-off-by: Henrik Rydberg <rydberg@bitmath.org>
>>
>> ---
>> Changelog : 
>> v1 : Inital attempt
>> v2 : Address logic and coding style
>> v3 : Removed some debug hangover. Added tested-by. Modifications for MacBookAir1,1
>> v4 : Do not expect busy state to appear without other state changes
>>
> 
> still works here (MacBookAir6,2)

Much appreciated Andreas.

Regards,
Brad

