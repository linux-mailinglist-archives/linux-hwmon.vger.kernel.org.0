Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31211AE986
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2020 05:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgDRDO5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 17 Apr 2020 23:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725782AbgDRDO4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 23:14:56 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5636EC061A0C
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2020 20:14:56 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so1986633pfc.12
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2020 20:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ur48VXUaFdnC01C4bcoPeLM1EgvU3txjNONbqUhnnrE=;
        b=b5gnCaWmxXu4zXd53OSULMOlXBYOalprRjamjZGN033JUvgHzYQSZn8T5rEwy9zjaS
         cDHcU0ERcd2vul1GR0xvABzoUl+vdh9pbi18ijTqIyBLaqidNx1//y81FqQCLSM0K1bm
         0D1chiJ/85ZfEZrA2e2mKAcnokQlGwiTzC4QIcMvmvlSsaDhDkr98KIGX6oJerBENsV0
         nyPL6jHQXK13UrnfAe6mpgTqIkKWiWmBupOrOBEq+PgCbnjaMafwVGzBBwA2lfwtXF12
         eCuPdzMajZhIQGPBtjfnDeEZc3teBpOV09SyeMZ7FjamkUWsLJk/kS0DwAW6/19C8DKo
         FDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ur48VXUaFdnC01C4bcoPeLM1EgvU3txjNONbqUhnnrE=;
        b=q5ukJkAeGAOaL587tcS6uFgnze6Ps6syWTSg8HM7qEvJgGp7IwG1DFFyC8LltuPGIk
         5tIRE8CNqOaHqPcw1r32sEcjOTwbKAQufIhOf/cPBAE50bvVc92avA+Bq0orcTQWTld9
         BeXZ09/GRdB73d0p5vCvqDgR0MhfXCeJLbswa0m95aa6WpljgAUEodbFKsFJqxKXlo+7
         yrdSnJyCRu6mmlaWUCEYc/7zd08Ap4T0/lsQpMesCXSmd5lvFxgBKWzEkh8FIFIoZthu
         ZcWydGvND0yC+ejqSKahFM9G6s4BWTqDJemjzNu4Cf+V7ChMBnon7I0l/MEhhjy9YhTn
         jAZQ==
X-Gm-Message-State: AGi0PuaiDzRNO8Y6VLpVPIOJCLpek/uPLx/TsCBzCn6TuO01hjXl8xyX
        ydkkyGDL/BfSkAxY6zRCAUE3Xl3+
X-Google-Smtp-Source: APiQypKI+NV75+qLMaSq9qQIMYWuvitNZfdfCtVYo30hddfHw9YiwtdqIsN2091Hu+mJ76MBK7y2uw==
X-Received: by 2002:a63:5d5c:: with SMTP id o28mr6347209pgm.322.1587179695415;
        Fri, 17 Apr 2020 20:14:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e11sm21149577pfl.65.2020.04.17.20.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 20:14:55 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (jc42) Fix name to have no illegal characters
To:     Jean Delvare <jdelvare@suse.de>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org
References: <20200417092853.31206-1-s.hauer@pengutronix.de>
 <20200417115503.249d4d48@endymion>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9ddf4f81-ac0d-8b76-134b-b5074b17ddfb@roeck-us.net>
Date:   Fri, 17 Apr 2020 20:14:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200417115503.249d4d48@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/17/20 2:55 AM, Jean Delvare wrote:
> Hi Sascha,
> 
> On Fri, 17 Apr 2020 11:28:53 +0200, Sascha Hauer wrote:
>> The jc42 driver passes I2C client's name as hwmon device name. In case
>> of device tree probed devices this ends up being part of the compatible
>> string, "jc-42.4-temp". This name contains hyphens and the hwmon core
>> doesn't like this:
>>
>> jc42 2-0018: hwmon: 'jc-42.4-temp' is not a valid name attribute, please fix
>>
>> This changes the name to "jc42" which doesn't have any illegal
>> characters.
> 
> I don't think "jc-42.4-temp" is a valid i2c client name either. I
> believe this should be fixed at the of->i2c level, rather than the
> i2c->hwmon level. Not sure how other drivers are dealing with that, it
> seems that in most cases the name part of the compatible string matches
> exactly the expected client name so no conversion is needed.
> 

The problem here is that the compatible string is simply wrong. It
precedes the time when I understood devicetree properties well enough
to understand what I was doing. Oh well.

No idea what to do at this point other than accepting this patch.

Guenter
