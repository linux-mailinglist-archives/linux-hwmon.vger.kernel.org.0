Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B506DAF62
	for <lists+linux-hwmon@lfdr.de>; Fri,  7 Apr 2023 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbjDGPHl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 7 Apr 2023 11:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjDGPHW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 11:07:22 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFB0C66A;
        Fri,  7 Apr 2023 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=DYFkdCSDS4Ml86wR/rzT/lksVBmTkBHp387dpNlv8X8=; b=sk9P3KwNaBmaH2Vp3bL5s6TvB7
        DZ8cgu9LPNMfhMLNKsjPPgv1j0wP6ro04VPJNvYKXoPLD/hg53c2e6WiY29WYMvPQUdESJMy0nhde
        QVCkhB6+4NChbqBXwu1Ol3je+xK3SVgkMGQFlQxRSK3YTa3FcD4RlzOfskGWC0Daw/FQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pkneM-009jYG-P9; Fri, 07 Apr 2023 17:05:14 +0200
Date:   Fri, 7 Apr 2023 17:05:14 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Igor Russkikh <irusskikh@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <simon.horman@corigine.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Xu Liang <lxu@maxlinear.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, oss-drivers@corigine.com,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 7/8] net: phy: nxp-tja11xx: constify pointers to
 hwmon_channel_info
Message-ID: <6772fccf-df6f-43b6-b5d5-3a92c052fa37@lunn.ch>
References: <20230407145911.79642-1-krzysztof.kozlowski@linaro.org>
 <20230407145911.79642-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407145911.79642-7-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 07, 2023 at 04:59:10PM +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
