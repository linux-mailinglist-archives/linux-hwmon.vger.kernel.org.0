Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5E7366A50
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Apr 2021 13:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238737AbhDUL71 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 21 Apr 2021 07:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46257 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239540AbhDUL7K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 07:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619006313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NaElvfhG1ut7UsAJQ3t0dihJhEtIJBT86R6S/1O/j40=;
        b=gUGXJ4E+AI61sCTC3GjZtsGjly7BS7z92ESwA8iiqzFXksNWUJp2WGhlZ8zw6VLkwoqKdE
        017yL7xwALAHTLtttsWgIXs62bG6PI44SwrrjLBcctMjRs43Eqjo+lMFQvIBDU5bH+zba2
        zy2fck+qZJw8UT11NAwD5rfPF+4Bs/E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-5D-qWUp3OKKA-oRpoa_8nw-1; Wed, 21 Apr 2021 07:58:32 -0400
X-MC-Unique: 5D-qWUp3OKKA-oRpoa_8nw-1
Received: by mail-ed1-f70.google.com with SMTP id f1-20020a0564021941b02903850806bb32so8958859edz.9
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 04:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NaElvfhG1ut7UsAJQ3t0dihJhEtIJBT86R6S/1O/j40=;
        b=EoiaoaiOn3IkOMlrC0ia7BBaWXLIvz8qbhjnDug407DnvYBznNZsoMcYL9pDJw6/5R
         JUKNQmFuNSV1oWIc5oJtM/EIKH9YvOmoEFykxHBSU4SxkkWDmPoqT/XgKFbtvbOmJw/P
         /q90kqRrE3kYxSpIZJtBhcrxPc6HpqMTyHgk76BQ0TztOxzvSOMXuSK74EH7pAjyRu1w
         WSKvD8xMfcVz5rQGW33naXHkvJJCE6Q7h9kY7G/2L26yUbAcSsuz4LsDpvmijkY5ocQ6
         TnRTY+m86wiXbVFMgkjXlI5WKLuddnpfEfaqOllPbUJZMqxS6eNf/sOoTI+/iSGWw0Iw
         NJRw==
X-Gm-Message-State: AOAM532tnWAun8Xspe8rQ9yO1wU7pbfGXxuR2i4L01j7rIYMnQF8Iv6k
        9o+x8ciq1w2YWs8h6GdCzrcoG7qzyVZD825X4P6OWbj95J3marbe9qA6ZUmEwr78lamYxgPNrcN
        R2ORnBMdvWLfAUdJzZQMAJsE=
X-Received: by 2002:a17:907:7b98:: with SMTP id ne24mr29344573ejc.304.1619006311006;
        Wed, 21 Apr 2021 04:58:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykm9U2sPDdnZLZb6hlL89pkjGxYx3pEKARR632PdA1BtTOsGpN7kfPinTw7pl16aa0kkYw3A==
X-Received: by 2002:a17:907:7b98:: with SMTP id ne24mr29344543ejc.304.1619006310788;
        Wed, 21 Apr 2021 04:58:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hg19sm2234762ejc.24.2021.04.21.04.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 04:58:30 -0700 (PDT)
Subject: Re: [PATCH v3 2/8] MAINTAINERS: Add entry for devm helpers
To:     matti.vaittinen@fi.rohmeurope.com,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <eec1797734e3d080662aa732c565ed4a3c261799.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <e064fdd7-b276-6732-16fe-2eb2564b2179@redhat.com>
 <YFn5CSB1O3i+SzgR@kroah.com>
 <da0233f3223d7c0816581afe0969caf0abe20378.camel@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <96935c55-c799-595e-024c-56fd352f279e@redhat.com>
Date:   Wed, 21 Apr 2021 13:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <da0233f3223d7c0816581afe0969caf0abe20378.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 4/21/21 9:51 AM, Matti Vaittinen wrote:
> 
> On Tue, 2021-03-23 at 15:19 +0100, Greg KH wrote:
>> On Tue, Mar 23, 2021 at 02:58:28PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/23/21 2:56 PM, Matti Vaittinen wrote:
>>>> Devm helper header containing small inline helpers was added.
>>>> Hans promised to maintain it.
>>>>
>>>> Add Hans as maintainer and myself as designated reviewer.
>>>>
>>> Ultimately this is up to Greg though, so lets wait and see what
>>> Greg has to say about this.
>>
>> Can we move some of the devm_* calls in include/device.h into here as
>> well so that you all can be in charge of them instead of me?
> 
> Seems like this was left w/o answer. I guess the question was pointed
> to Hans

I believe that Greg was (mostly) joking here. At least that is how
I interpreted Greg's reply,which is why I did not answer.

Also note that Greg merged this series, but not this patch,
so the new devm-helpers.h file will presumably be maintained by Greg.

Regards,

Hans

