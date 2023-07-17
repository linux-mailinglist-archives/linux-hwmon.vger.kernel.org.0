Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF96F756F9C
	for <lists+linux-hwmon@lfdr.de>; Tue, 18 Jul 2023 00:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjGQWLK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 17 Jul 2023 18:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjGQWLJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 18:11:09 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C869E6C
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 15:11:09 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qLWQr-0036Nj-Pm; Mon, 17 Jul 2023 22:11:05 +0000
Message-ID: <c923a3cc-dcab-7c4a-f740-68f78fb2c226@khalifa.ws>
Date:   Mon, 17 Jul 2023 23:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] hwmon: (nct6775) Increase and reorder ALARM/BEEP bits
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230717201050.1657809-1-ahmad@khalifa.ws>
 <c5257431-cdb0-49ad-bbec-861c6b233b25@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <c5257431-cdb0-49ad-bbec-861c6b233b25@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/07/2023 22:13, Guenter Roeck wrote:
> Tested working on nct6797, with no functional differences observed,
> and the code looks good to me.
> 
> Applied to hwmon-next.

Thanks. Will update the 18 IN and the 8 TEMPs and send them separately.


-- 
Regards,
Ahmad Khalifa
