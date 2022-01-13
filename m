Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572AE48D2D6
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Jan 2022 08:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiAMHbV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Jan 2022 02:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiAMHbU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jan 2022 02:31:20 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD75C06173F
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jan 2022 23:31:20 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id h14so12473945ybe.12
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jan 2022 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=NNLomldTLXzZkKzvhuIvT0B+QcFkXoBDwKjq+GKGx38=;
        b=OAJ9iNPIfk6TLuxsrNtfmMZC/wUdcvdKIcf2qVEkvPdB8iyGJF+nEyOtqEBbOYosRS
         YqGUHpNTD1uCVWuuGu+IALgeXE1wI1DPiptFFqMKmVaUPBulyh5upSlbG8cB7BesQ55g
         w7Ro4PUosouRBtrWrZ0h0HiUsb3W/aM9Ez7qvG6tJrBDAmW2y+Zvr7C1ix978npSkLPt
         yPI42QYZuBhZhd2z+mkgqGwh+ij7+4RGZBsdxmd5FsUVXRSgz43dYrMdKosGVYmUCREU
         m4XRII1P3stUiUkA1dhnF0ETtJ7u500AuZBVt7zyY4XNhzl9Nfj2yK2MyG5hJ7yvs9vC
         QuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=NNLomldTLXzZkKzvhuIvT0B+QcFkXoBDwKjq+GKGx38=;
        b=SVU3mQ+DK+dcVcLr0sTXAJ/JeWm6Ww72CwkLW9YifE23xVurUYu6rPFdt8l1K7K2WO
         bYR6y5KZrRTMN7XSam8E2VLEbtbtsn3pc2RSFzB3ZXymbtGmzBepBzBavTSHOlLsLfjw
         j42Ej6zqgUZ+ho37MmrUPDsffNzP2nVlms0Fqm/OohLnNgVs/crlXu9GzsZ2MEJ3PXUh
         vKAo36GU+10hAYqkYB8H9HAJdHhdSNAFlsqr/EkvmnivU5G9eh+3k8aHOAo+R+otFar1
         ck/CTKsqcofE4w33HVCx9oFrXDvKrQ6h5639OaXtFP0G3Epu8LTdoZ3meTO2thrQn+z/
         jsBg==
X-Gm-Message-State: AOAM533kfIlZXyW9+08tpLt+ZRsp9NeXc8To4EwInlRjoecdSNuObVw4
        MEMVBTTUqnXV94F7s9PNdnmNQRhOu/KH6q+ErQs=
X-Google-Smtp-Source: ABdhPJzvZZ0mV9eCWkMQr4GH7YlHHxKHLiFlpnVR/xR982eeriswzp1a6hV/KMeJ+acsowVJYi+SgrGr3InATM8sOO0=
X-Received: by 2002:a25:aae2:: with SMTP id t89mr4538610ybi.638.1642059079790;
 Wed, 12 Jan 2022 23:31:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:e6d4:0:0:0:0:0 with HTTP; Wed, 12 Jan 2022 23:31:18
 -0800 (PST)
Reply-To: gabrieledgal47@gmail.com
In-Reply-To: <CAKiB1vAqFPPk5bDz4bLDWNzGghGrmCCf_HFVd+97G4ZUrgPQ0w@mail.gmail.com>
References: <CAKiB1vBRt2+Nf3Chr4kW3RkXJFoV21BDPA9Y8Kax=LQxXSuw8w@mail.gmail.com>
 <CAKiB1vD=ZAo_aykr2rJe=UnyHR1=KLz2N6HX8LXOvJCyoW2dzA@mail.gmail.com>
 <CAKiB1vCw-5mXVr7Kw4pH5byp3v6b-UxQVJuSsNggfr0zaVesaw@mail.gmail.com> <CAKiB1vAqFPPk5bDz4bLDWNzGghGrmCCf_HFVd+97G4ZUrgPQ0w@mail.gmail.com>
From:   Gabriel Edgal <mrgabrieledgal875@gmail.com>
Date:   Wed, 12 Jan 2022 23:31:18 -0800
Message-ID: <CAKiB1vCrw3Ws0E4Y6i6YDh1+vADBgt=CvUpnNoGv=ZRg=SCFTQ@mail.gmail.com>
Subject: NICE TO MEET
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear friend.

I'm Mr. Gabriel Edgal, I'm the chief internal auditor of Btci Bank, I have
an abandoned fund $ 9.5 million dollars to transfer to you, as we shall
parts 50:50. You will only stand as a relative of my deceased client as
bears the same surname as you, the fund was deposited in our bank for
many years back by my deceased client who died with his whole
family in a car accident in 2010. I would like to invite you as a foreigner
partner to stand as the next of kin of the deceased client, so that we
will place a claim on the deposited fund and divide it between the two
of
us 50:50 each. I want you to answer me immediately for more information


With best regards,
Mr. Gabriel Edgal
