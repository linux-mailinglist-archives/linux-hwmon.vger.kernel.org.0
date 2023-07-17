Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EAE756AD3
	for <lists+linux-hwmon@lfdr.de>; Mon, 17 Jul 2023 19:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjGQRjx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 17 Jul 2023 13:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjGQRjw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 13:39:52 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C3691
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 10:39:51 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qLSCL-0035QL-9B; Mon, 17 Jul 2023 17:39:49 +0000
Message-ID: <e8744ee0-7953-347e-c0e9-f80132fc0eec@khalifa.ws>
Date:   Mon, 17 Jul 2023 18:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (nct6775) Increase and reorder ALARM/BEEP bits
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230717164927.1625616-1-ahmad@khalifa.ws>
 <f6581485-54a6-1b83-dbba-9289b4c84fbb@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <f6581485-54a6-1b83-dbba-9289b4c84fbb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/07/2023 18:25, Guenter Roeck wrote:
> On 7/17/23 09:49, Ahmad Khalifa wrote:
>> * Increase available bits, IN: 16 to 24, FAN: 8 to 12,
>>    TEMP: 6 to 12
> 
> intrusion: 2 to 4 ? Curious: Why ? It doesn't seem to be used,
> and it could easily be extended later if really needed.

Just thought I'd save others having to reorder bits again.
But thinking about it now, never seen a 4-door case.
Having 2 only and beep at 50 means the whole thing likely pads to
52B instead of 56B.

Will update.

> Move the story behind the change (what you tried but didn't work)
> after '---' and just list the actual changes in the commit description.

Testing note too?

>> Testing note:
>> * Tested on nct6799 with IN/FAN/TEMP, and changing min/max/high/hyst,
>>    that triggers the corresponding alarms correctly. Good confirmation
>>    on the original mapping of the registers and masks.
>>    As to be expected, only 4 fans and 2 temps (fixed) have limits
>>    currently on nct6799 on my board.
>> * Trouble with testing intrusion alarms and beeps, no way to confirm
>>    those. As I understand now, intrusion/caseopen is probably not
>>    connected on my board.
>>    And I haven't seen a buzzer on a board in ages.

-- 
Regards,
Ahmad Khalifa
